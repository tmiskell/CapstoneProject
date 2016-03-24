/* Includes */
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <linux/i2c-dev.h>
#include <linux/i2c.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <time.h>
/* Define constants. */
#define MAX_CHAR 1023                           /* Number of characters in buffer. */
#define ATMEGA_ADDR 0x04                        /* Atmega I2C address. */
#define TOTAL_NUM_CONTACTS 13                   /* Total number of contact sensors. */
#define NUM_FINGER_CONTACTS 2                   /* Number of contact sensors per finger. */
#define NUM_HANDS 2                             /* Number of hands. */
#define NUM_FINGERS 5                           /* Number of fingers per hand. */
#define NUM_FOLDS 4                             /* Number of inter-digital folds per hand. */
#define MAX_ADC 1023                            /* The maximum 10-bit ADC value. */
#define FLEX_BYTES 2
#define CONTACT_BYTES 2
#define LSM303_BYTES 5
#define NUM_303 2                               /* Number of connected LSM303 accelerometers. */
#define NUM_303_VALS 6                          /* Number of values per LSM303 accelerometer reading. */
#define TOTAL_NUM_303 NUM_303 * NUM_303_VALS    /* Total number of LSM303 values. */
#define SEP_NUM_303 TOTAL_NUM_303 / 2           /* Number of LSM303 values for a given type (accelerometer or magnetometer). */
#define NUM_303_NAMES 3                         /* The number of LSM303 value names. */
#define LSM9DOF_BYTES 6
#define NUM_9DOF 2                              /* Number of connected LSM9DOF accelerometers. */
#define NUM_9DOF_VALS 9                         /* Number of values per LSM9DOF accelerometer reading. */
#define TOTAL_NUM_9DOF NUM_9DOF * NUM_9DOF_VALS /* Total number of LSM9DOF values. */
#define SEP_NUM_9DOF TOTAL_NUM_9DOF / 3         /* Number of LSM9DOF values for a given type (accelerometer, magnetometer, or gyrometer). */
#define NUM_9DOF_NAMES 4                        /* The number of LSM9DOF value names. */
#define NUM_ARGS ((NUM_FINGERS * 2) + 1) + 2    /* The number of command line arguments. */
/* Custom type definitions. */
typedef enum{ false, true } bool ; /* Used to define boolean values. */
struct Finger{  /* Structure to store finger related data. */
  unsigned int flex ;
  bool contact[NUM_FINGER_CONTACTS] ;
} ;
struct Fold{    /* Structure to store inter-digital fold related data. */
  bool contact ;
} ;
struct LSM303{  /* Structure to store LSM303 accelerometer related data. */
  double accel_x ;
  double accel_y ;
  double accel_z ;
  double mag_x ;
  double mag_y ;
  double mag_z ;
} ;
struct LSM9DOF{ /* Structure to store LSM9DOF accelerometer related data. */
  double accel_x ;
  double accel_y ;
  double accel_z ;
  double mag_x ;
  double mag_y ;
  double mag_z ;
  double gyro_x ;
  double gyro_y ;
  double gyro_z ;
} ;
struct Hand{    /* Structure to store hand related data. */
  struct Finger fingers[NUM_FINGERS] ;
  struct Fold fold[NUM_FOLDS] ;
  struct LSM303 lsm303[NUM_303] ;  
  struct LSM9DOF lsm9dof[NUM_9DOF] ;  
} ;
/* Global variables. */
volatile sig_atomic_t kb_flag = 0 ; /* Keyboard interrupt flag. */
/* Function declarations. */
bool i2c_read( const char* f_name, char buffer[MAX_CHAR], unsigned int num_bytes, const unsigned int addr,
	       int* fd, bool open_file, bool close_file, int oflags, mode_t mode ) ;
bool i2c_write( const char* f_name, char buffer[MAX_CHAR], unsigned int num_bytes, const unsigned int addr, 
		int* fd, bool open_file, bool close_file, int oflags, mode_t mode ) ;
void data_init( struct Hand hands[NUM_HANDS], unsigned int left_flex[NUM_FINGERS], unsigned int right_flex[NUM_FINGERS], 
                bool left_contact[TOTAL_NUM_CONTACTS], bool right_contact[TOTAL_NUM_CONTACTS], 
                double left_303_accel[SEP_NUM_303], double left_303_mag[SEP_NUM_303],
                double right_303_accel[SEP_NUM_303], double right_303_mag[SEP_NUM_303],
                double left_9dof_accel[SEP_NUM_9DOF], double left_9dof_mag[SEP_NUM_9DOF], double left_9dof_gyro[SEP_NUM_9DOF],
                double right_9dof_accel[SEP_NUM_9DOF], double right_9dof_mag[SEP_NUM_9DOF], double right_9dof_gyro[SEP_NUM_9DOF] ) ;
bool write_file( char f_name[MAX_CHAR], struct Hand hands[NUM_HANDS], char status[MAX_CHAR], 
                 unsigned int lb[NUM_FINGERS], unsigned int ub[NUM_FINGERS] ) ;
void store_data( struct Hand hands[NUM_HANDS], unsigned int flex[NUM_FINGERS], bool contact[TOTAL_NUM_CONTACTS], 
                 double accel303[SEP_NUM_303], double mag303[SEP_NUM_303], double accel9dof[SEP_NUM_9DOF], double mag9dof[SEP_NUM_9DOF],
                 double gyro9dof[SEP_NUM_9DOF], unsigned int i ) ;
void group_data( struct Hand hands[NUM_HANDS], unsigned int left_flex[NUM_FINGERS], unsigned int right_flex[NUM_FINGERS], 
                 bool left_contact[TOTAL_NUM_CONTACTS], bool right_contact[TOTAL_NUM_CONTACTS], 
                 double left_303_accel[SEP_NUM_303], double left_303_mag[SEP_NUM_303],
                 double right_303_accel[SEP_NUM_303], double right_303_mag[SEP_NUM_303],
                 double left_9dof_accel[SEP_NUM_9DOF], double left_9dof_mag[SEP_NUM_9DOF], double left_9dof_gyro[SEP_NUM_9DOF],
                 double right_9dof_accel[SEP_NUM_9DOF], double right_9dof_mag[SEP_NUM_9DOF], double right_9dof_gyro[SEP_NUM_9DOF] ) ;
void print_values( struct Hand hands[NUM_HANDS] ) ;
bool reset_sensor( char* f_name ) ;
double adjust_flex( unsigned int x, unsigned int lb, unsigned int ub ) ;
void print_table( char border[MAX_CHAR], char header[MAX_CHAR], char entry[NUM_HANDS][MAX_CHAR] ) ;
void add_border( char border[MAX_CHAR], int border_len, char c_div, char v_div ) ;
void signal_handler( int sig ) ;
bool valid_int( char* str ) ;

int main( int argc, char* argv[] ){
  /* Main function. */

  char* I2C_FILE = "/dev/i2c-1" ;           /* Location of I2C Device. */ 
                                            /* Number after "i2c-" is device number, which can be assigned dynamically. */
  unsigned int num_bytes ;                  /* Number of bytes to write. */
  char buffer[MAX_CHAR] ;                   /* Buffer to store current data read from I2C device. */
  char cmd[MAX_CHAR] ;                      /* The next command to send to the microcontroller. */
  unsigned int i ;                          /* An iterator. */
  unsigned int j ;                          /* An iterator. */
  unsigned int k ;                          /* An iterator. */
  bool open_file = true ;                   /* An indicator if a file should be opened. */
  bool close_file = true ;                  /* An indicator if a file should be closed. */
  int oflags = O_RDWR ;                     /* Flags to use when opening a file. */
  mode_t mode = S_IWUSR | S_IRUSR ;         /* Permissions to use when opening a file. */
  int fd ;                                  /* File handle. */
  int result = EXIT_SUCCESS ;               /* Indicator if the program exited successfully. */
  unsigned int left_flex[NUM_FINGERS] ;     /* Array to store the left hand flex sensor data. */
  unsigned int right_flex[NUM_FINGERS] ;    /* Array to store the right hand flex sensor data. */
  bool left_contact[TOTAL_NUM_CONTACTS] ;   /* Array to store the left hand contact sensor data. */
  bool right_contact[TOTAL_NUM_CONTACTS] ;  /* Array to store the right hand contact sensor data. */
  struct timespec update_t ;                /* Amount of time to wait during a microcontroller update. */
  struct timespec update_t_rem ;            /* Remaining time if update delay is interrupted. */
  struct timespec read_t ;                  /* Amount of time to wait between I2C read operations. */
  struct timespec read_t_rem ;              /* Remaining time if I2C read delay is interrupted. */
  struct Hand hands[NUM_HANDS] ;            /* Array to store data for both hands. */
  char status[MAX_CHAR] ;                   /* Status of sensor, either connected or disconnected. */
  double left_303_accel[SEP_NUM_303] ;      /* LSM303 accelerometer data for the left hand. */
  double left_303_mag[SEP_NUM_303] ;        /* LSM303 magnetometer data for the left hand. */
  double right_303_accel[SEP_NUM_303] ;     /* LSM303 accelerometer data for the right hand. */
  double right_303_mag[SEP_NUM_303] ;       /* LSM303 magnetometer data for the right hand. */
  double left_9dof_accel[SEP_NUM_9DOF] ;    /* LSM9DOF accelerometer data for the left hand. */
  double left_9dof_mag[SEP_NUM_9DOF] ;      /* LSM9DOF magnetometer data for the left hand. */
  double left_9dof_gyro[SEP_NUM_9DOF] ;     /* LSM9DOF gyrometer data for the left hand. */
  double right_9dof_accel[SEP_NUM_9DOF] ;   /* LSM9DOF accelerometer data for the right hand. */
  double right_9dof_mag[SEP_NUM_9DOF] ;     /* LSM9DOF magnetometer data for the right hand. */
  double right_9dof_gyro[SEP_NUM_9DOF] ;    /* LSM9DOF gyrometer data for the right hand. */
  char* un = getenv( "USER" ) ;             /* The current user name. */
  char f_name[MAX_CHAR] ;                   /* File to store data. */
  char* gpio_f_name = "/sys/class/gpio/gpio27/value" ; /* File handle used to reset microcontroller. */
  unsigned int lb[NUM_FINGERS] ;            /* The lower bounds to use for calibrating the flex sensors. Ranges from 0-1023. */
  unsigned int ub[NUM_FINGERS] ;            /* The upper bounds to use for calibrating the flex sensors. Ranges from 0-1023.*/
  bool reset = true ;                       /* An indicator if the microcontroller should be reset. */
  char* finger_name[NUM_FINGERS] = {"ind",  /* A list of names for the flex sensors. */
                                    "mid", 
                                    "ri", 
                                    "pi",
                                    "th"
                                   } ;

  fprintf( stdout, "Initializing\n" ) ;
  fprintf( stdout, "Applying calibration settings\n" ) ;
  if( argc != NUM_ARGS ){
    fprintf( stderr, "Usage: %s in_lb in_ub mid_lb mid_ub ri_lb ri_ub pi_lb pi_ub th_lb th_ub update_delay_ms read_delay_ms\n", argv[0] ) ;
    return EXIT_FAILURE ;
  }
  j = 1 ;
  /* Parse calibration settings. */
  for( i = 0 ; i < NUM_FINGERS ; i++ ){
    if( !valid_int(argv[j]) )
      fprintf( stderr, "*** Invalid calibration setting for flex sensor lower bound: %s ***\n", argv[j] ) ;
    fprintf( stdout, "%s flex lower bound threshold set to: %s\n", finger_name[i], argv[j] ) ;
    lb[i] = atoi( argv[j++] ) ;
    if( !valid_int(argv[j]) )
      fprintf( stderr, "*** Invalid calibration setting for flex sensor upper bound: %s ***\n", argv[j] ) ;
    fprintf( stdout, "%s flex upper bound threshold set to: %s\n", finger_name[i], argv[j] ) ;
    ub[i] = atoi( argv[j++] ) ;
    if( lb[i] == ub[i] )
      fprintf( stderr, "*** Invalid calibration setting: Lower bound and upper bound should not be equal. ***" ) ;
  }
  /* Parse delay settings. */
  if( !valid_int(argv[j]) )
    fprintf( stderr, "*** Invalid calibration setting for update delay: %s ***\n", argv[j] ) ;
  fprintf( stdout, "Update delay: %s ms\n", argv[j] ) ;
  update_t.tv_sec = atoi( argv[j] ) / 1000 ;
  update_t.tv_nsec = (unsigned long int)((atoi( argv[j++] ) % 1000) * 1000000 ) ;
  if( !valid_int(argv[j]) )
    fprintf( stderr, "*** Invalid calibration setting for I2C read delay: %s ***\n", argv[j] ) ;
  fprintf( stdout, "I2C read delay: %s ms\n", argv[j] ) ;
  read_t.tv_sec = atoi( argv[j] ) / 1000 ;
  read_t.tv_nsec = (unsigned long int)((atoi( argv[j++] ) % 1000) * 1000000 ) ;
  /* Register keyboard interrupt handler. */
  signal( SIGINT, signal_handler ) ;
  /* Initialize status and command. */
  memset( status, '\0', sizeof(char) * MAX_CHAR ) ;
  memset( cmd, '\0', sizeof(char) * MAX_CHAR ) ;
  /* Initialize output file name. */
  sprintf( f_name, "/home/%s/CapstoneProject/gesture_data/gesture_data_init.xml", un ) ;
  /* Initialize data. */
  data_init( hands, left_flex, right_flex, left_contact, right_contact, 
             left_303_accel, left_303_mag, right_303_accel, right_303_mag,
             left_9dof_accel, left_9dof_mag, left_9dof_gyro, right_9dof_accel, right_9dof_mag, right_9dof_gyro ) ;
  /* Continually read current sensor data. */
  while( true ){
    if( reset ){
      /* Reset microcontroller. */
      fprintf( stdout, "Reseting microcontroller.\n" ) ;
      if( !reset_sensor(gpio_f_name) )
        perror( "*** Unable to reset sensor " ) ;
      reset = false ;
    }
    strcpy( status, "connected" ) ;
    /* Reset microcontroller internal pointer. */
    cmd[0] = 0 ;
    num_bytes = 1 ;
    if( !i2c_write(I2C_FILE, cmd, num_bytes, ATMEGA_ADDR, &fd, open_file, close_file, oflags, mode) ){
      /* I2C bus write error. */
      strcpy( status, "disconnected" ) ;
      reset = true ;
    }
    /* Allow microcontroller sufficient time to update values. */
    nanosleep( &update_t, &update_t_rem ) ;
    /* Read flex sensors. */
    fprintf( stdout, "Reading flex sensors and contact sensors\n" ) ;
    /* Allow sufficient time between reads. */
    num_bytes = (FLEX_BYTES * ( NUM_FINGERS - 1 )) + CONTACT_BYTES ;
    memset( buffer, '\0', sizeof(char) * MAX_CHAR ) ;
    if( !i2c_read(I2C_FILE, buffer, num_bytes, ATMEGA_ADDR, &fd, open_file, close_file, oflags, mode) ){
      /* I2C bus read error. */
      strcpy( status, "disconnected" ) ;
      reset = true ;
      break ;
    }
    for( i = 0 ; i < (NUM_FINGERS - 1) ; i++ ){ /* Note the thumb currently doesn't have a flex sensor. */
      right_flex[i] = (unsigned int)((buffer[i*2] << 8) | buffer[(i*2)+1]) ; /* Currently there is only a right handed glove. */
      if( right_flex[i] > MAX_ADC ){
	fprintf( stderr, "*** Flex sensor value %u exceeds %u, attempting to reset microcontroller.\n", right_flex[i], MAX_ADC ) ;
	reset = true ;
      }
    }
    /* Read contact sensors. */
    for( i = 0 ; i < TOTAL_NUM_CONTACTS ; i++ ){
      if( i < 8 )
        right_contact[i] = (bool)((buffer[FLEX_BYTES*(NUM_FINGERS-1)] >> i) & 0x01 );
      else
        right_contact[i] = (bool)((buffer[(FLEX_BYTES*(NUM_FINGERS-1))+1] >> (i % 8)) & 0x01 );
      /* Invert the value so that contact is true, and no contact is false. */
      if( right_contact[i] == true )
        right_contact[i] = false ;
      else
	right_contact[i] = true ;
    }
    nanosleep( &read_t, &read_t_rem ) ;
    /* Read accelerometers. */
    fprintf( stdout, "Reading LSM303 accelerometers\n" ) ; 
    num_bytes = LSM303_BYTES * NUM_303_VALS ;
    for( i = 0 ; i < NUM_303 ; i++ ){
      memset( buffer, '\0', sizeof(char) * MAX_CHAR ) ;
      if( !i2c_read(I2C_FILE, buffer, num_bytes, ATMEGA_ADDR, &fd, open_file, close_file, oflags, mode) ){
        /* I2C bus read error. */
        strcpy( status, "disconnected" ) ;
        reset = true ;
        break ;
      }
      char lsm_303_buffer[LSM303_BYTES+1] ; /* Buffer to store LSM303 value. */
      for( j = 0 ; j < (NUM_303_VALS / 2) ; j++ ){
	for( k = 0 ; k < LSM303_BYTES ; k++ )
	  lsm_303_buffer[k] = buffer[(j*LSM303_BYTES)+k] ;
	lsm_303_buffer[k] = '\0' ;
        right_303_accel[(i*(NUM_303_VALS/2))+j] = (double)atoi( lsm_303_buffer ) ; /* Currently there is only a right handed glove. */
      }
      for( ; j < NUM_303_VALS ; j++ ){
	for( k = 0 ; k < LSM303_BYTES ; k++ )
	  lsm_303_buffer[k] = buffer[(j*LSM303_BYTES)+k] ;
	lsm_303_buffer[k] = '\0' ;
        right_303_mag[(i*(NUM_303_VALS/2))+(j%(NUM_303_VALS/2))] = (double)atoi( lsm_303_buffer ) ; 
      }
      nanosleep( &read_t, &read_t_rem ) ;
    }
    fprintf( stdout, "Reading LSM9DOF accelerometers\n" ) ; 
    for( i = 0 ; i < NUM_9DOF ; i++ ){
      num_bytes = LSM9DOF_BYTES * 5 ;
      memset( buffer, '\0', sizeof(char) * MAX_CHAR ) ;
      /* Read first half of block of data. */
      if( !i2c_read(I2C_FILE, buffer, num_bytes, ATMEGA_ADDR, &fd, open_file, close_file, oflags, mode) ){
        /* I2C bus read error. */
        strcpy( status, "disconnected" ) ;
        reset = true ;
        break ;
      }
      nanosleep( &read_t, &read_t_rem ) ;
      char temp_buffer[MAX_CHAR] ;
      strcpy( temp_buffer, buffer ) ;
      num_bytes = LSM9DOF_BYTES * 4 ;
      /* Read second half of block of data. */
      if( !i2c_read(I2C_FILE, buffer, num_bytes, ATMEGA_ADDR, &fd, open_file, close_file, oflags, mode) ){
        /* I2C bus read error. */
        strcpy( status, "disconnected" ) ;
        reset = true ;
        break ;
      }
      strcat( temp_buffer, buffer ) ;
      strcpy( buffer, temp_buffer ) ;
      char lsm_9dof_buffer[7] ;
      for( j = 0 ; j < (NUM_9DOF_VALS / 3) ; j++ ){
	for( k = 0 ; k < LSM9DOF_BYTES ; k++ )
	  lsm_9dof_buffer[k] = buffer[(j*LSM9DOF_BYTES)+k] ;
	lsm_9dof_buffer[k] = '\0' ;
        right_9dof_accel[(i*(NUM_9DOF_VALS/3))+j] = (double)atoi( lsm_9dof_buffer ) ; /* Currently there is only a right handed glove. */
      }
      for( ; j < ((NUM_9DOF_VALS * 2) / 3) ; j++ ){
	for( k = 0 ; k < LSM9DOF_BYTES ; k++ )
	  lsm_9dof_buffer[k] = buffer[(j*LSM9DOF_BYTES)+k] ;
	lsm_9dof_buffer[k] = '\0' ;
        right_9dof_mag[(i*(NUM_9DOF_VALS/3))+(j%(NUM_9DOF_VALS/3))] = (double)atoi( lsm_9dof_buffer ) ; 
      }
      for( ; j < NUM_9DOF_VALS ; j++ ){
	for( k = 0 ; k < LSM9DOF_BYTES ; k++ )
	  lsm_9dof_buffer[k] = buffer[(j*LSM9DOF_BYTES)+k] ;
	lsm_9dof_buffer[k] = '\0' ;
        right_9dof_gyro[(i*(NUM_9DOF_VALS/3))+(j%(NUM_9DOF_VALS/3))] = (double)atoi( lsm_9dof_buffer ) ;
      }
      nanosleep( &read_t, &read_t_rem ) ;
    }
    /* Group the data. */
    group_data( hands, left_flex, right_flex, left_contact, right_contact, 
                left_303_accel, left_303_mag, right_303_accel, right_303_mag,
                left_9dof_accel, left_9dof_mag, left_9dof_gyro, right_9dof_accel, right_9dof_mag, right_9dof_gyro ) ;
    print_values( hands ) ;
    /* Output current sensor data to file. */
    fprintf( stdout, "Writing sensor data to:\t%s\n", f_name ) ;
    if( !write_file(f_name, hands, status, lb, ub) )
      perror( "*** Error writing sensor data " ) ;
    if( kb_flag )
      /* Keyboard interrupt pressed. Perform clean up. */
      break ;
  }
  fprintf( stdout, "\nExiting\n" ) ;

  return result ;

}

bool i2c_read( const char* f_name, char buffer[MAX_CHAR], unsigned int num_bytes, const unsigned int addr,
                      int* fd, bool open_file, bool close_file, int oflags, mode_t mode ){
  /* Function to read from an I2C device. */

  if( open_file ){
    *fd = open( f_name, oflags, mode ) ; /* File pointer. O_RDONLY, S_IRUSR */
    /* Verify file opened successfully. */
    if( *fd == -1 ){
      /* File did not open successfully.  */
      perror( "*** Unable to open I2C connection " ) ;
      close(*fd) ;
      return false ;
    }
  }
  /* Address device. */
  if( ioctl(*fd, I2C_SLAVE, addr) < 0 ){
    perror( "*** Unable to address I2C device " ) ;
    close(*fd) ;
    return false ;
  }
  /* Read byte(s) from register. */
  if( read(*fd, buffer, num_bytes) != num_bytes  ){
    perror( "*** Unable to read from I2C bus " ) ;
    close(*fd) ;
    return false ;
  }
  if( close_file ){
    /* Close connection to device. */
    if( close(*fd) == -1 ){
      /* File did not close successfully.  */
      perror( "*** Unable to close I2C connection " ) ;
      return false ;
    }
  }
  /*fprintf( stdout, "I2C Received %s\n", buffer ) ;*/

  return true ;
  
}

bool i2c_write( const char* f_name, char buffer[MAX_CHAR], unsigned int num_bytes, const unsigned int addr, 
		int* fd, bool open_file, bool close_file, int oflags, mode_t mode ){
  /* Function to write to an I2C device. */

  if( open_file ){
    *fd = open( f_name, oflags, mode ) ; /* File pointer. O_WRONLY, S_IWUSR */
    /* Verify file opened successfully. */
    if( *fd == -1 ){
      /* File did not open successfully.  */
      perror( "*** Unable to open I2C connection " ) ;
      close(*fd) ;
      return false ;
    }
  }
  /* Address device. */
  if( ioctl(*fd, I2C_SLAVE, addr) < 0 ){
    perror( "*** Unable to address I2C device " ) ;
    close(*fd) ;
    return false ;
  }
  /* Write to device. */
  if( write(*fd, buffer, num_bytes) != num_bytes ){
    perror( "*** Unable to write to I2C bus " ) ;
    close(*fd) ;
    return false ;
  }
  if( close_file ){
    /* Close connection to device. */
    if( close(*fd) == -1 ){
      /* File did not close successfully.  */
      perror( "*** Unable to close I2C connection " ) ;
      return false ;
    }
  }
  /*fprintf( stdout, "I2C Sent %s\n", buffer ) ;*/

  return true ;
  
}

void data_init( struct Hand hands[NUM_HANDS], unsigned int left_flex[NUM_FINGERS], unsigned int right_flex[NUM_FINGERS], 
                bool left_contact[TOTAL_NUM_CONTACTS], bool right_contact[TOTAL_NUM_CONTACTS], 
                double left_303_accel[SEP_NUM_303], double left_303_mag[SEP_NUM_303],
                double right_303_accel[SEP_NUM_303], double right_303_mag[SEP_NUM_303],
                double left_9dof_accel[SEP_NUM_9DOF], double left_9dof_mag[SEP_NUM_9DOF], double left_9dof_gyro[SEP_NUM_9DOF],
                double right_9dof_accel[SEP_NUM_9DOF], double right_9dof_mag[SEP_NUM_9DOF], double right_9dof_gyro[SEP_NUM_9DOF] ){
  /* Function to initialize the sensor data and data structure. */

  unsigned int i ; /* An iterator. */
  unsigned int j ; /* An iterator. */
  unsigned int k ; /* An iterator. */

  for( i = 0 ; i < NUM_FINGERS ; i++ ){
    left_flex[i] = 0 ;
    right_flex[i] = 0 ;
  }
  for( i = 0 ; i < TOTAL_NUM_CONTACTS ; i++ ){
    left_contact[i] = 0 ;
    right_contact[i] = 0 ;
  }
  for( i = 0 ; i < SEP_NUM_303 ; i++ ){
    left_303_accel[i] = 0 ;
    left_303_mag[i] = 0 ;
    right_303_accel[i] = 0 ;
    right_303_mag[i] = 0 ;
  }
  for( i = 0 ; i < SEP_NUM_9DOF ; i++ ){
    left_9dof_accel[i] = 0 ;
    left_9dof_mag[i] = 0 ;
    left_9dof_gyro[i] = 0 ;
    right_9dof_accel[i] = 0 ;
    right_9dof_mag[i] = 0 ;
    right_9dof_gyro[i] = 0 ;
  }
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    for( j = 0 ; j < NUM_FINGERS ; j++ ){
      hands[i].fingers[j].flex = 0 ;
      for( k = 0 ; k < NUM_FINGER_CONTACTS ; k++ ){
        hands[i].fingers[j].contact[k] = 0 ;
      }
    }
    for( j = 0 ; j < NUM_303 ; j++ ){
      hands[i].lsm303[j].accel_x = 0.0 ;
      hands[i].lsm303[j].accel_y = 0.0 ;
      hands[i].lsm303[j].accel_z = 0.0 ;
      hands[i].lsm303[j].mag_x = 0.0 ;
      hands[i].lsm303[j].mag_y = 0.0 ;
      hands[i].lsm303[j].mag_z = 0.0 ;
    }
    for( j = 0 ; j < NUM_9DOF ; j++ ){
      hands[i].lsm9dof[j].accel_x = 0.0 ;
      hands[i].lsm9dof[j].accel_y = 0.0 ;
      hands[i].lsm9dof[j].accel_z = 0.0 ;
      hands[i].lsm9dof[j].mag_x = 0.0 ;
      hands[i].lsm9dof[j].mag_y = 0.0 ;
      hands[i].lsm9dof[j].mag_z = 0.0 ;
      hands[i].lsm9dof[j].gyro_x = 0.0 ;
      hands[i].lsm9dof[j].gyro_y = 0.0 ;
      hands[i].lsm9dof[j].gyro_z = 0.0 ;
    }
  }

  return ;

}

void store_data( struct Hand hands[NUM_HANDS], unsigned int flex[NUM_FINGERS], bool contact[TOTAL_NUM_CONTACTS], 
                 double accel303[SEP_NUM_303], double mag303[SEP_NUM_303], double accel9dof[SEP_NUM_9DOF], double mag9dof[SEP_NUM_9DOF],
                 double gyro9dof[SEP_NUM_9DOF], unsigned int i ){
  /* Function to store the data into the appropriate fields within the data structure. */

  unsigned int j ; /* An iterator. */
  unsigned int k ; /* An iterator. */
  unsigned int m = 0 ; /* An iterator. */

  for( j = 0 ; j < NUM_FINGERS ; j++ ){
    hands[i].fingers[j].flex = flex[j] ;
    for( k = 0 ; k < NUM_FINGER_CONTACTS ; k++ ){
      hands[i].fingers[j].contact[k] = contact[m] ; 
      m++ ;
      if( j == (NUM_FINGERS - 1) )
        /* Currently the thumb has only one contact sensor. */
	break ;
    }
  }
  for( j = 0 ; j < NUM_FOLDS ; j++ ){
    hands[i].fold[j].contact = contact[m] ;
    m++ ;
  }
  k = 0 ;
  for( j = 0 ; j < NUM_303 ; j++ ){
    hands[i].lsm303[j].accel_x = accel303[k] ;
    hands[i].lsm303[j].mag_x = mag303[k++] ;
    hands[i].lsm303[j].accel_y = accel303[k] ;
    hands[i].lsm303[j].mag_y = mag303[k++] ;
    hands[i].lsm303[j].accel_z = accel303[k] ;
    hands[i].lsm303[j].mag_z = mag303[k++] ;
  }
  k = 0 ;
  for( j = 0 ; j < NUM_9DOF ; j++ ){
    hands[i].lsm9dof[j].accel_x = accel9dof[k] ;
    hands[i].lsm9dof[j].mag_x = mag9dof[k] ;
    hands[i].lsm9dof[j].gyro_x = gyro9dof[k++] ;
    hands[i].lsm9dof[j].accel_y = accel9dof[k] ;
    hands[i].lsm9dof[j].mag_y = mag9dof[k] ;
    hands[i].lsm9dof[j].gyro_y = gyro9dof[k++] ;
    hands[i].lsm9dof[j].accel_z = accel9dof[k] ;
    hands[i].lsm9dof[j].mag_z = mag9dof[k] ;
    hands[i].lsm9dof[j].gyro_z = gyro9dof[k++] ;
  }

  return ;

}
 
void group_data( struct Hand hands[NUM_HANDS], unsigned int left_flex[NUM_FINGERS], unsigned int right_flex[NUM_FINGERS], 
                 bool left_contact[TOTAL_NUM_CONTACTS], bool right_contact[TOTAL_NUM_CONTACTS], 
                 double left_303_accel[SEP_NUM_303], double left_303_mag[SEP_NUM_303],
                 double right_303_accel[SEP_NUM_303], double right_303_mag[SEP_NUM_303],
                 double left_9dof_accel[SEP_NUM_9DOF], double left_9dof_mag[SEP_NUM_9DOF], double left_9dof_gyro[SEP_NUM_9DOF],
                 double right_9dof_accel[SEP_NUM_9DOF], double right_9dof_mag[SEP_NUM_9DOF], double right_9dof_gyro[SEP_NUM_9DOF] ){
  /* Function to group the sensor data into a data structure. */

  unsigned int i ;     /* An iterator. */

  for( i = 0 ; i < NUM_HANDS ; i++ ){
    if( i == 0 ){
      /* Left hand data. */
      store_data( hands, left_flex, left_contact, left_303_accel, left_303_mag, left_9dof_accel, left_9dof_mag, left_9dof_gyro, i ) ;
    }
    else{
      /* Right hand data. */
      store_data( hands, right_flex, right_contact, right_303_accel, right_303_mag, right_9dof_accel, right_9dof_mag, right_9dof_gyro, i ) ;     
    }
  }

  return ;

}

bool write_file( char f_name[MAX_CHAR], struct Hand hands[NUM_HANDS], char status[MAX_CHAR], 
                 unsigned int lb[NUM_FINGERS], unsigned int ub[NUM_FINGERS] ){
  /* Function to generate an output XML file. */

  FILE* fp ;                                   /* File handle. */
  char* hand_name[NUM_HANDS] = {"left",        /* A list of names for the hands. */
                                "right"
                               } ;
  char* finger_name[NUM_FINGERS] = {"index",   /* A list of names for the fingers. */
                                    "middle", 
                                    "ring", 
                                    "pinky",
                                    "thumb"
                                   } ;
  char* fold_name[NUM_FOLDS] = {"thumb-index",              /* A list of names for the folds between fingers. */
                                "index-middle", 
                                "middle-ring", 
                                "ring-pinky"
                               } ;      
  char* contact_name[NUM_FINGER_CONTACTS] = {"contact-tip", /* A list of the contact names. */
                                             "contact-mid"
                                            } ;       
  char* lsm303_side[NUM_303] = {"top",                      /* A list of the LSM303 positions. */
                                "bottom"
                               } ;       
  char* lsm9dof_side[NUM_9DOF] = {"top",                    /* A list of the LSM303 positions. */
                                  "bottom"
                                 } ;       
  unsigned int i ;  /* An iterator. */
  unsigned int j ;  /* An iterator. */
  unsigned int k ;  /* An iterator. */
  unsigned int flex_adjust ; /* The adjusted flex sensor value, in the range 0 - 100. */

  fp = fopen( f_name, "w" ) ;
  if( fp == NULL ){
    return false ;
  }
  /* Write the header. */
  fprintf( fp,  "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\n" ) ;
  fprintf( fp,  "<?xml-stylesheet type=\"text/xsl\" href=\"gesture_data.xsl\"?>\n" ) ;
  fprintf( fp,  "<!DOCTYPE gestures SYSTEM \"gesture_data.dtd\">\n" ) ;
  /* Write the next set of gestures. */
  fprintf( fp,  "<gestures>\n" ) ;
  /* Write the next gesture. */
  fprintf( fp,  "\t<gesture>\n" ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    /* Write the next set of hand data. */
    fprintf( fp, "\t\t<hand side=\"%s\">\n", hand_name[i] ) ;
    for( j = 0 ; j < NUM_FINGERS ; j++ ){
      /* Write the next set of finger data. */
      fprintf( fp, "\t\t\t<%s>\n", finger_name[j] ) ;
      /* Express flex sensor values in range 0-100.*/
      flex_adjust = adjust_flex( hands[i].fingers[j].flex, lb[j], ub[j] ) ;
      fprintf( fp, "\t\t\t\t<flex>%u</flex>\n", flex_adjust ) ; 
      for( k = 0 ; k < NUM_FINGER_CONTACTS ; k++ ){
	if( (strcmp(finger_name[j], "thumb") == 0) && (k == (NUM_FINGER_CONTACTS - 1)) ){
	  /* Thumb only has a tip contact sensor. */
	  break ;
	}
	/* Convert binary values to boolean values. */
        if( hands[i].fingers[j].contact[k] ){
          fprintf( fp, "\t\t\t\t<%s>true</%s>\n", contact_name[k], contact_name[k] ) ; 
        }
        else{
          fprintf( fp, "\t\t\t\t<%s>false</%s>\n", contact_name[k], contact_name[k] ) ; 
        }
      }
      /* Close out the finger data. */
      fprintf( fp, "\t\t\t</%s>\n", finger_name[j] ) ;
    }
    for( j = 0 ; j < NUM_FOLDS ; j++ ){
      /* Write the next set of fold data. */
      fprintf( fp, "\t\t\t<%s>\n", fold_name[j] ) ;
      if( hands[i].fold[j].contact ){
        fprintf( fp, "\t\t\t\t<%s>true</%s>\n", contact_name[0], contact_name[0] ) ;
      }
      else{
        fprintf( fp, "\t\t\t\t<%s>false</%s>\n", contact_name[0], contact_name[0] ) ;
      }
      /* Close out the fold data. */
      fprintf( fp, "\t\t\t</%s>\n", fold_name[j] ) ;
    }
    for( j = 0 ; j < NUM_303 ; j++ ){ /* Only print out one accelerometer for now. */
      /* Write the next set of LSM303 accelerometer data. */
      fprintf( fp, "\t\t\t<lsm303 side=\"%s\">\n", lsm303_side[j] ) ;
      fprintf( fp, "\t\t\t\t<accel-x>%f</accel-x>\n", hands[i].lsm303[j].accel_x ) ;
      fprintf( fp, "\t\t\t\t<accel-y>%f</accel-y>\n", hands[i].lsm303[j].accel_y ) ;
      fprintf( fp, "\t\t\t\t<accel-z>%f</accel-z>\n", hands[i].lsm303[j].accel_z ) ;
      fprintf( fp, "\t\t\t\t<mag-x>%f</mag-x>\n", hands[i].lsm303[j].mag_x ) ;
      fprintf( fp, "\t\t\t\t<mag-y>%f</mag-y>\n", hands[i].lsm303[j].mag_y ) ;
      fprintf( fp, "\t\t\t\t<mag-z>%f</mag-z>\n", hands[i].lsm303[j].mag_z ) ;
      fprintf( fp, "\t\t\t</lsm303>\n" ) ;
    }
    for( j = 0 ; j < NUM_9DOF ; j++ ){ /* Only print out one accelerometer for now. */
      /* Write the next set of LSM9DOF accelerometer data. */
      fprintf( fp, "\t\t\t<lsm9dof side=\"%s\">\n", lsm9dof_side[j] ) ;
      fprintf( fp, "\t\t\t\t<accel-x>%f</accel-x>\n", hands[i].lsm9dof[j].accel_x ) ;
      fprintf( fp, "\t\t\t\t<accel-y>%f</accel-y>\n", hands[i].lsm9dof[j].accel_y ) ;
      fprintf( fp, "\t\t\t\t<accel-z>%f</accel-z>\n", hands[i].lsm9dof[j].accel_z ) ;
      fprintf( fp, "\t\t\t\t<mag-x>%f</mag-x>\n", hands[i].lsm9dof[j].mag_x ) ;
      fprintf( fp, "\t\t\t\t<mag-y>%f</mag-y>\n", hands[i].lsm9dof[j].mag_y ) ;
      fprintf( fp, "\t\t\t\t<mag-z>%f</mag-z>\n", hands[i].lsm9dof[j].mag_z ) ;
      fprintf( fp, "\t\t\t\t<gyro-x>%f</gyro-x>\n", hands[i].lsm9dof[j].gyro_x ) ;
      fprintf( fp, "\t\t\t\t<gyro-y>%f</gyro-y>\n", hands[i].lsm9dof[j].gyro_y ) ;
      fprintf( fp, "\t\t\t\t<gyro-z>%f</gyro-z>\n", hands[i].lsm9dof[j].gyro_z ) ;
      fprintf( fp, "\t\t\t</lsm9dof>\n" ) ;
    }
    /* Close out the hand data. */
    fprintf( fp, "\t\t</hand>\n" ) ;
  } 
  /* Close out the gesture data. */
  fprintf( fp, "\t</gesture>\n" ) ;
  /* Write the converted text. */
  fprintf( fp, "\t<converted-text></converted-text>\n" ) ;
  /* Write the sensor status. */
  fprintf( fp, "\t<status>%s</status>\n", status ) ;
  /* Write the conversion status. */
  fprintf( fp, "\t<convert>false</convert>\n" ) ;
  /* Write the XML version. */
  fprintf( fp, "\t<version>1.0</version>\n" ) ;
  /* Close out the set of gestures. */
  fprintf( fp, "</gestures>\n" ) ;
  fclose( fp ) ;

  return true ;

}

bool reset_sensor( char* f_name ){
  /* Function to reset the microcontroller and attached sensors. */

  FILE* fp ;                                /* File handle. */
  struct timespec t1 ;                      /* Amount of time to wait. */
  struct timespec t2 ;                      /* Remaining time if delay is interrupted. */
  const unsigned int NUM_REPS = 3 ;         /* The number of iterations to perform. */
  unsigned int i ;                          /* An iterator. */

  t1.tv_sec = 0.0 ;
  t1.tv_nsec = 500000000L ;   

  /* Open a handle to the GPIO pin. Create a distinct pulse. */
  for( i = 0 ; i < NUM_REPS ; i++ ){
    fp = fopen( f_name, "w" ) ;
    if( fp == NULL ){
      return false ;
    }
    if( (i % 2) != 0 ){
      fprintf( fp, "0" ) ;  
    }
    else{
      fprintf( fp, "1" ) ;  
    }
    fclose( fp ) ;
    nanosleep( &t1, &t2 ) ;
  }
  /* Wait sufficient time for the microcontroller to reset.  */
  t1.tv_sec = 2.0 ;
  t1.tv_nsec = 0 ;   
  fprintf( stdout, "Waiting for microcontroller to reset..." ) ;
  nanosleep( &t1, &t2 ) ;
  fprintf( stdout, "Done.\n" ) ;

  return true ;
}

void print_values( struct Hand hands[NUM_HANDS] ){
  /* Function to print the values read from the sensors to the screen. */

  char* hand_name[NUM_HANDS] = {"left",         /* A list of names for the hands. */
                                "right"
                               } ;
  char* finger_name[NUM_FINGERS] = {"ind",    /* A list of names for the flex sensors. */
                                    "mid", 
                                    "ri", 
                                    "pi",
                                    "th"
                                   } ;
  char* fold_name[NUM_FOLDS] = {"th-ind",  /* A list of names for the folds between fingers. */
                                "ind-mid", 
                                "mid-ri", 
                                "ri-pi"
                               } ;             
  char* lsm303_side[NUM_303] = {"top",          /* A list of the LSM303 positions. */
                                "bottom"
                               } ;       
  char* lsm303_name[NUM_303_NAMES] = {"LSM303 Loc.",           /* A list of the LSM303 value names. */
                                      "Accelerometer",
                                      "Magnetometer"
                                     } ;       
  char* lsm9dof_side[NUM_9DOF] = {"top",        /* A list of the LSM303 positions. */
                                  "bottom"
                                 } ;       
  char* lsm9dof_name[NUM_9DOF_NAMES] = {"LSM9DOF Loc.",          /* A list of the LSM9DOF value names. */
                                        "Accelerometer",
                                        "Magnetometer",
                                        "Gyrometer"
                                       } ;       
  char c_div = '+' ;                            /* The corner divider to print. */
  char v_div = '-' ;                            /* The vertical divider to print. */
  char h_div = '|' ;                            /* The horizontal divider to print. */
  unsigned int i ;                              /* An iterator. */
  unsigned int j ;                              /* An iterator. */
  char border[MAX_CHAR] ;                       /* Buffer to store the border. */
  char header[MAX_CHAR] ;                       /* Buffer to store the table entry contents. */
  char entry[NUM_HANDS][MAX_CHAR] ;             /* Buffer to store the table entry contents. */

  /* Print out the table of flex sensor values. */
  memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
  memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
    sprintf( entry[i], "%c %-*s ", h_div, (int)strlen("Flex Location"), hand_name[i] ) ;
  }
  sprintf( header, "%c %s ", h_div, "Flex Location" ) ;
  add_border( border, strlen("Flex Location") + 2, c_div, v_div ) ;
  for( j = 0 ; j < NUM_FINGERS ; j++ ){
    if( strcmp(finger_name[j], "th") == 0 ){
      /* Currently the thumb does not have a flex sensor. */
      continue ;
    }
    sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("xxx"), finger_name[j] ) ;
    add_border( border, strlen(" xxx "), c_div, v_div ) ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
      sprintf( entry[i] + strlen(entry[i]), "%c %*u ", h_div, (int)strlen("xxx"), hands[i].fingers[j].flex ) ;
    }
  }
  sprintf( border + strlen(border), "%c\n", c_div ) ;
  sprintf( header + strlen(header), "%c\n", h_div ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    sprintf( entry[i] + strlen(entry[i]), "%c\n", h_div ) ;
  }
  print_table( border, header, entry ) ;
  /* Print out the table of contact sensor values. */
  memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
  memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
    sprintf( entry[i], "%c %-*s ", h_div, (int)strlen("Contact Loc."), hand_name[i] ) ;
  }
  sprintf( header, "%c %s ", h_div, "Contact Loc." ) ;
  add_border( border, strlen("Contact Loc.") + 2, c_div, v_div ) ;
  for( j = 0 ; j < NUM_FINGERS ; j++ ){
    sprintf( header + strlen(header), "%c %s tip ", h_div, finger_name[j] ) ;
    add_border( border, strlen(finger_name[j]) + strlen(" tip ") + 1, c_div, v_div ) ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
      sprintf( entry[i] + strlen(entry[i]), "%c%*u", h_div, (int)(strlen(finger_name[j]) + 1 + strlen(" tip ")), hands[i].fingers[j].contact[0] ) ;
    }
    if( strcmp(finger_name[j], "th") == 0 ){
      /* Currently the thumb has only one contact sensor. */
      continue ;
    }
    sprintf( header + strlen(header), "%c %s mid ", h_div, finger_name[j] ) ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
      sprintf( entry[i] + strlen(entry[i]), "%c%*u", h_div, (int)(strlen(finger_name[j]) + 1 + strlen(" tip ")), hands[i].fingers[j].contact[1] ) ;
    }
    add_border( border, strlen(finger_name[j]) + strlen(" mid ") + 1, c_div, v_div ) ;
  }
  /* Print out the table of interdigital fold contact values. */
  for( j = 0 ; j < NUM_FOLDS ; j++ ){
    sprintf( header + strlen(header), "%c %s ", h_div, fold_name[j] ) ;
    for( i = 0 ; i < NUM_HANDS ; i++ ){
      sprintf( entry[i] + strlen(entry[i]), "%c%*u", h_div, (int)(strlen(fold_name[j]) + 2), hands[i].fold[j].contact ) ;
    }
    add_border( border, strlen(fold_name[j]) + 2, c_div, v_div ) ;
  }
  sprintf( border + strlen(border), "%c\n", c_div ) ;
  sprintf( header + strlen(header), "%c\n", h_div ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    sprintf( entry[i] + strlen(entry[i]), "%c\n", h_div ) ;
  }
  print_table( border, header, entry ) ;
  /* Print out the table of LSM303 values. */
  memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
  memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
  }
  for( j = 0 ; j < NUM_303_NAMES ; j++ ){
    if( strcmp(lsm303_name[j], "LSM303 Loc.") == 0 ){
      sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("right bottom"), lsm303_name[j] ) ;
      add_border( border, strlen("right bottom") + 2, c_div, v_div ) ;
    }
    else{
      sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("(+xxx.x, +xxx.x, +xxx.x)"), lsm303_name[j] ) ;
      add_border( border, strlen("(+xxx.x, +xxx.x, +xxx.x)") + 2, c_div, v_div ) ;
    }
  }
  sprintf( border + strlen(border), "%c\n", c_div ) ;
  sprintf( header + strlen(header), "%c\n", h_div ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    for( j = 0 ; j < NUM_303 ; j++ ){
      sprintf( entry[i] + strlen(entry[i]), "%c %-*s %-*s %c (%+06.1f, %+06.1f, %+06.1f) ", h_div, (int)strlen("right"), hand_name[i], 
               (int)strlen("bottom"), lsm303_side[j], h_div, hands[i].lsm303[j].accel_x, hands[i].lsm303[j].accel_y, hands[i].lsm303[j].accel_z ) ;
      sprintf( entry[i] + strlen(entry[i]), "%c (%+06.1f, %+06.1f, %+06.1f) %c\n", h_div,
               hands[i].lsm303[j].mag_x, hands[i].lsm303[j].mag_y, hands[i].lsm303[j].mag_z, h_div ) ;
    }
  }
  print_table( border, header, entry ) ;
  /* Print out the table of LSM9DOF values. */
  memset( header, '\0', sizeof(char) * MAX_CHAR ) ;
  memset( border, '\0', sizeof(char) * MAX_CHAR ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    memset( entry[i], '\0', sizeof(char) * MAX_CHAR ) ;
  }
  for( j = 0 ; j < NUM_9DOF_NAMES ; j++ ){
    if( strcmp(lsm9dof_name[j], "LSM9DOF Loc.") == 0 ){
      sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("right bottom"), lsm9dof_name[j] ) ;
      add_border( border, strlen("right bottom") + 2, c_div, v_div ) ;
    }
    else{
      sprintf( header + strlen(header), "%c %-*s ", h_div, (int)strlen("(+xxxxx.x, +xxxxx.x, +xxxxx.x)"), lsm9dof_name[j] ) ;
      add_border( border, strlen("(+xxxxx.x, +xxxxx.x, +xxxxx.x)") + 2, c_div, v_div ) ;
    }
  }
  sprintf( border + strlen(border), "%c\n", c_div ) ;
  sprintf( header + strlen(header), "%c\n", h_div ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    for( j = 0 ; j < NUM_9DOF ; j++ ){
      sprintf( entry[i] + strlen(entry[i]), "%c %-*s %-*s %c (%+08.1f, %+08.1f, %+08.1f) ", h_div, (int)strlen("right"), hand_name[i], 
               (int)strlen("bottom"), lsm9dof_side[j], h_div, 
               hands[i].lsm9dof[j].accel_x, hands[i].lsm9dof[j].accel_y, hands[i].lsm9dof[j].accel_z ) ;
      sprintf( entry[i] + strlen(entry[i]), "%c (%+08.1f, %+08.1f, %+08.1f) ", h_div,
               hands[i].lsm9dof[j].mag_x, hands[i].lsm9dof[j].mag_y, hands[i].lsm9dof[j].mag_z ) ;
      sprintf( entry[i] + strlen(entry[i]), "%c (%+08.1f, %+08.1f, %+08.1f) %c\n", h_div,
               hands[i].lsm9dof[j].gyro_x, hands[i].lsm9dof[j].gyro_y, hands[i].lsm9dof[j].gyro_z, h_div ) ;
    }
  }
  print_table( border, header, entry ) ;

  return ;

}

double adjust_flex( unsigned int x, unsigned int lb, unsigned int ub ){
  /* Function to adjust flex sensor values from a 0-1024 scale to a 0-100 quantized scale. */

  const unsigned int MIN_VAL = 0 ;       /* Minimum adjusted value. */
  const unsigned int MAX_VAL = 100 ;     /* Maximum adjusted value. */
  const unsigned int NUM_STEPS = 10 ;    /* Resolution. */
  unsigned int i ;                       /* An iterator. */
  double dx = ((double)ub - (double)lb) / (double)(NUM_STEPS - 2) ; /* X increment. */
  double dy = (double)MAX_VAL / (double)NUM_STEPS ;                 /* Y increment. */
  double y ;                                                        /* Adjusted flex sensor value. */

  if( x == 0 ){
    y = (double)MIN_VAL ;   
  }
  else if( x == MAX_ADC ){
    y = (double)MAX_VAL - dy ;   
  }
  else if( x < lb ){
    y = (double)MIN_VAL ;   
  }
  else if( x >= ub ){
    y = (double)MAX_VAL - dy ;   
  }
  else{
    /* MIN_VAL and MAX_VAL account for two out of the total number of steps.
       Therefore start at 1 and go to NUM_STEPS - 1. */
    for( i = 1 ; i < (NUM_STEPS - 1) ; i++ ){
      if( (double)x < ((double)lb + ((double)i * dx)) ){
        y = ((double)i * dy) ;
        break ;
      }
    }  
  }
  return y ;

}

void signal_handler( int sig ){ 

    kb_flag = 1 ; 

    return ;

}

bool valid_int( char* str ){

  int result ;  /* The result of the string to integer conversion. */
  
  result = atoi( str ) ;
  if( (result == 0) && (str[0] != '0') )
    /* Not a valid integer. */
    return false ;
  if( result < 0 )
    /* Calibration settings should be non-negative. */
    return false ;
  /* Valid integer. */
  return true ;

}

void print_table( char border[MAX_CHAR], char header[MAX_CHAR], char entry[NUM_HANDS][MAX_CHAR] ){
  /* Function to print a table. */

  unsigned int i ; /* An iterator. */

  fprintf( stdout, "%s", border ) ;
  fprintf( stdout, "%s", header ) ;
  fprintf( stdout, "%s", border ) ;
  for( i = 0 ; i < NUM_HANDS ; i++ ){
    fprintf( stdout, "%s", entry[i] ) ;
  }
  fprintf( stdout, "%s", border ) ;

  return ;

}

void add_border( char border[MAX_CHAR], int border_len, char c_div, char v_div ){
  /* Function to add a border to a table. */

  int i ; /* An iterator. */

  /* Print the border. */
  border[strlen(border)] = c_div ;
  for( i = 0 ; i < border_len ; i++ ){
    border[strlen(border)] = v_div ;
  }

  return ;

}
