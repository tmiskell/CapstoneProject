/* Create the table. */
/* Key: */ 
/*        hand:		The hand, either left or right. */
/*        th_flex: 	The thumb flex sensor value. */
/*        in_flex: 	The index finger flex sensor value. */
/*        mi_flex: 	The middle finger flex sensor value. */ 
/*        ri_flex: 	The ring finger flex sensor value. */ 
/*        pi_flex: 	The pinky finger flex sensor value. */ 
/*        th_con_t:	The thumb tip contact sensor value. */
/*        in_con_t:  	The index finger tip contact sensor value. */
/*        mi_con_t:	The middle finger tip contact sensor value. */
/*        ri_con_t:	The ring finger tip contact sensor value. */
/*        pi_con_m:	The pinky finger mid contact sensor value. */
/*        in_con_m:  	The index finger mid contact sensor value. */
/*        mi_con_m:	The middle finger mid contact sensor value. */
/*        ri_con_m:	The ring finger mid contact sensor value. */
/*        pi_con_m:	The pinky finger mid contact sensor value. */
/*        ti_con_t:	The thumb-index interdigital fold contact sensor value. */
/*        im_con_t:	The index-middle interdigital fold contact sensor value. */
/*        mr_con_t:	The middle-ring interdigital fold contact sensor value. */
/*        rp_con_t:	The ring-pinky interdigital fold contact sensor value. */
/*        accel_303_x:  LSM303 X axis accelerometer value. */
/*        accel_303_y:  LSM303 Y axis accelerometer value. */
/*        accel_303_z:  LSM303 X axis accelerometer value. */
/*        mag_303_x:    LSM303 X axis magnetometer value. */
/*        mag_303_y:    LSM303 Y axis magnetometer value. */
/*        mag_303_z:    LSM303 X axis magnetometer value. */
/*        accel_9dof_x: LSM9DOF X axis accelerometer value. */
/*        accel_9dof_y: LSM9DOF Y axis accelerometer value. */
/*        accel_9dof_z: LSM9DOF X axis accelerometer value. */
/*        mag_9dof_x:   LSM9DOF X axis magnetometer value. */
/*        mag_9dof_y:   LSM9DOF Y axis magnetometer value. */
/*        mag_9dof_z:   LSM9DOF X axis magnetometer value. */
/*        gyro_9dof_x:  LSM9DOF X axis gyrometer value. */
/*        gyro_9dof_y:  LSM9DOF Y axis gyrometer value. */
/*        gyro_9dof_z:  LSM9DOF X axis gyrometer value. */
/*        gest:		The gesture that corresponds to the given set of sensor values. */
/*        open:           100.0 */
/*        half-open:       50.0 */
/*        closed:           0.0 */
/*        contact:            1 */
/*        no contact:         0 */
/*        upright:            (  0.0,   0.0,   0.0) */
/*        angled-foward-45:   ( 25.0,  25.0,  25.0) */
/*        angled-forward-90:  ( 50.0,  50.0,  50.0) */
/*        angled-forward-135: ( 75.0,  75.0,  75.0) */
/*        angled-forward-180: (100.0, 100.0, 100.0) */
DROP TABLE IF EXISTS gesture_tbl;
CREATE TABLE IF NOT EXISTS gesture_tbl (
   id INT NOT NULL AUTO_INCREMENT,
   hand ENUM("left", "right") NOT NULL, 
   th_flex DOUBLE NOT NULL,
   in_flex DOUBLE NOT NULL,
   mi_flex DOUBLE NOT NULL,
   ri_flex DOUBLE NOT NULL,
   pi_flex DOUBLE NOT NULL,
   th_con_t BOOLEAN NOT NULL,
   in_con_t BOOLEAN NOT NULL,
   mi_con_t BOOLEAN NOT NULL,
   ri_con_t BOOLEAN NOT NULL,
   pi_con_t BOOLEAN NOT NULL,
   in_con_m BOOLEAN NOT NULL,
   mi_con_m BOOLEAN NOT NULL,
   ri_con_m BOOLEAN NOT NULL,
   pi_con_m BOOLEAN NOT NULL,
   ti_con_t BOOLEAN NOT NULL,
   im_con_t BOOLEAN NOT NULL,
   mr_con_t BOOLEAN NOT NULL,
   rp_con_t BOOLEAN NOT NULL,
   accel_303_x DOUBLE NOT NULL,
   accel_303_y DOUBLE NOT NULL,
   accel_303_z DOUBLE NOT NULL,
   mag_303_x DOUBLE NOT NULL,
   mag_303_y DOUBLE NOT NULL,
   mag_303_z DOUBLE NOT NULL,
   accel_9dof_x DOUBLE NOT NULL,
   accel_9dof_y DOUBLE NOT NULL,
   accel_9dof_z DOUBLE NOT NULL,
   mag_9dof_x DOUBLE NOT NULL,
   mag_9dof_y DOUBLE NOT NULL,
   mag_9dof_z DOUBLE NOT NULL,
   gyro_9dof_x DOUBLE NOT NULL,
   gyro_9dof_y DOUBLE NOT NULL,
   gyro_9dof_z DOUBLE NOT NULL,
   gest VARCHAR(100), 
   in_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY ( id )
   );
/* Add entries to the table. Omit J and Z for now as they contain movement. */
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, " ");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "A");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 100.0, 100.0, 100.0, 100.0, 100.0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "B");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 50.0, 50.0, 50.0, 50.0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "C");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "D");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "E");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 0.0, 100.0, 100.0, 100.0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "F");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "G");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 0.0, 0.0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "H");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 100.0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "I");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 0.0, 0.0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "K");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 100.0, 100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "L");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "M");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "N");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 50.0, 50.0, 50.0, 50.0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "O");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 100.0, 100.0, 50.0, 50.0, 50.0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "P");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "Q");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "R");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "S");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "T");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "U");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 25.0, 25.0, 25.0, "V");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 100.0, 0.0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "W");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 50.0, 0.0, 0.0, 0.0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "X");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 100.0, 0.0, 0.0, 0.0, 100.0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "Y");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 50.0, 50.0, 50.0, 50.0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "0");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 100.0, 100.0, 100.0, 0.0, 0.0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 100.0, 100.0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "4");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 100.0, 100.0, 100.0, 100.0, 100.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "5");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 100.0, 0.0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "6");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 50.0, 100.0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "7");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 100.0, 50.0, 100.0, 100.0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "8");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m, 
                         accel_303_x, accel_303_y, accel_303_z, mag_303_x, mag_303_y, mag_303_z, 
                         accel_9dof_x, accel_9dof_y, accel_9dof_z, mag_9dof_x, mag_9dof_y, mag_9dof_z, gyro_9dof_x, gyro_9dof_y, gyro_9dof_z, gest)
       VALUES("right", 50.0, 50.0, 100.0, 100.0, 100.0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
              0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, "9");
