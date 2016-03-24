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
/*        accel_303_0_x:  Top LSM303 X axis accelerometer value. */
/*        accel_303_0_y:  Top LSM303 Y axis accelerometer value. */
/*        accel_303_0_z:  Top LSM303 X axis accelerometer value. */
/*        mag_303_0_x:    Top LSM303 X axis magnetometer value. */
/*        mag_303_0_y:    Top LSM303 Y axis magnetometer value. */
/*        mag_303_0_z:    Top LSM303 X axis magnetometer value. */
/*        accel_303_1_x:  Bottom LSM303 X axis accelerometer value. */
/*        accel_303_1_y:  Bottom LSM303 Y axis accelerometer value. */
/*        accel_303_1_z:  Bottom LSM303 X axis accelerometer value. */
/*        mag_303_1_x:    Bottom LSM303 X axis magnetometer value. */
/*        mag_303_1_y:    Bottom LSM303 Y axis magnetometer value. */
/*        mag_303_1_z:    Bottom LSM303 X axis magnetometer value. */
/*        accel_9dof_0_x: Top LSM9DOF X axis accelerometer value. */
/*        accel_9dof_0_y: Top LSM9DOF Y axis accelerometer value. */
/*        accel_9dof_0_z: Top LSM9DOF X axis accelerometer value. */
/*        mag_9dof_0_x:   Top LSM9DOF X axis magnetometer value. */
/*        mag_9dof_0_y:   Top LSM9DOF Y axis magnetometer value. */
/*        mag_9dof_0_z:   Top LSM9DOF X axis magnetometer value. */
/*        gyro_9dof_0_x:  Top LSM9DOF X axis gyrometer value. */
/*        gyro_9dof_0_y:  Top LSM9DOF Y axis gyrometer value. */
/*        gyro_9dof_0_z:  Top LSM9DOF X axis gyrometer value. */
/*        accel_9dof_1_x: Top LSM9DOF X axis accelerometer value. */
/*        accel_9dof_1_y: Top LSM9DOF Y axis accelerometer value. */
/*        accel_9dof_1_z: Top LSM9DOF X axis accelerometer value. */
/*        mag_9dof_1_x:   Top LSM9DOF X axis magnetometer value. */
/*        mag_9dof_1_y:   Top LSM9DOF Y axis magnetometer value. */
/*        mag_9dof_1_z:   Top LSM9DOF X axis magnetometer value. */
/*        gyro_9dof_1_x:  Top LSM9DOF X axis gyrometer value. */
/*        gyro_9dof_1_y:  Top LSM9DOF Y axis gyrometer value. */
/*        gyro_9dof_1_z:  Top LSM9DOF X axis gyrometer value. */
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
	accel_303_0_x DOUBLE NOT NULL,
	accel_303_0_y DOUBLE NOT NULL,
	accel_303_0_z DOUBLE NOT NULL,
	mag_303_0_x DOUBLE NOT NULL,
	mag_303_0_y DOUBLE NOT NULL,
	mag_303_0_z DOUBLE NOT NULL,
	accel_303_1_x DOUBLE NOT NULL,
	accel_303_1_y DOUBLE NOT NULL,
	accel_303_1_z DOUBLE NOT NULL,
	mag_303_1_x DOUBLE NOT NULL,
	mag_303_1_y DOUBLE NOT NULL,
	mag_303_1_z DOUBLE NOT NULL,
	accel_9dof_0_x DOUBLE NOT NULL,
	accel_9dof_0_y DOUBLE NOT NULL,
	accel_9dof_0_z DOUBLE NOT NULL,
	mag_9dof_0_x DOUBLE NOT NULL,
	mag_9dof_0_y DOUBLE NOT NULL,
	mag_9dof_0_z DOUBLE NOT NULL,
	gyro_9dof_0_x DOUBLE NOT NULL,
	gyro_9dof_0_y DOUBLE NOT NULL,
	gyro_9dof_0_z DOUBLE NOT NULL,
	accel_9dof_1_x DOUBLE NOT NULL,
	accel_9dof_1_y DOUBLE NOT NULL,
	accel_9dof_1_z DOUBLE NOT NULL,
	mag_9dof_1_x DOUBLE NOT NULL,
	mag_9dof_1_y DOUBLE NOT NULL,
	mag_9dof_1_z DOUBLE NOT NULL,
	gyro_9dof_1_x DOUBLE NOT NULL,
	gyro_9dof_1_y DOUBLE NOT NULL,
	gyro_9dof_1_z DOUBLE NOT NULL,
	gest VARCHAR(100),
	in_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( id )
	);
/* Add entries to the table. Omit J and Z for now as they contain movement. */
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 50, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		204, 168, 940, -216, -228, -316, 0, 0, 0, 0, 0, 0, 
		-698, -5301, 14715, -2596, 6295, 5631, -286, 108, -674, 0, 0, 0, 0, 0, 0, 0, 0, 0, "1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		452, 88, 856, -336, -183, -239, 0, 0, 0, 0, 0, 0, 
		1849, -4111, 14964, -3341, 5868, 5584, 134, 365, -524, 0, 0, 0, 0, 0, 0, 0, 0, 0, "2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		316, 272, 880, -270, -266, -264, 0, 0, 0, 0, 0, 0, 
		2261, -2248, 14924, -3675, 5170, 5342, 33, 77, -601, 0, 0, 0, 0, 0, 0, 0, 0, 0, "3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		500, 252, 792, -353, -267, -174, 0, 0, 0, 0, 0, 0, 
		2663, -2324, 15135, -3775, 4700, 5246, -208, 635, -167, 0, 0, 0, 0, 0, 0, 0, 0, 0, "4");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		328, 148, 888, -221, -212, -275, 0, 0, 0, 0, 0, 0, 
		-1309, -1940, 15730, -2066, 5467, 5205, 192, 423, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, "5");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 
		-88, 432, 868, -14, -250, -317, 0, 0, 0, 0, 0, 0, 
		-7817, -2705, 14511, -77, 6234, 5395, 146, 21, -613, 0, 0, 0, 0, 0, 0, 0, 0, 0, "6");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 
		492, 392, 724, -328, -223, -178, 0, 0, 0, 0, 0, 0, 
		-1108, -755, 15720, -2748, 5486, 5042, 39, -35, -452, 0, 0, 0, 0, 0, 0, 0, 0, 0, "7");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		428, 496, 708, -295, -261, -181, 0, 0, 0, 0, 0, 0, 
		-2707, 783, 15683, -1981, 5201, 5144, 203, 96, -361, 0, 0, 0, 0, 0, 0, 0, 0, 0, "8");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		200, 272, 916, -205, -300, -270, 0, 0, 0, 0, 0, 0, 
		-1887, -3504, 15353, -2477, 5321, 5948, -57, 240, -493, 0, 0, 0, 0, 0, 0, 0, 0, 0, "9");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 
		136, 152, 944, -4096, -278, -285, 0, 0, 0, 0, 0, 0, 
		6489, -7018, 12073, -5102, 6071, 4678, 13, 28, -514, 0, 0, 0, 0, 0, 0, 0, 0, 0, "A");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		352, 100, 896, -4096, -248, -242, 0, 0, 0, 0, 0, 0, 
		5119, -7419, 12301, -5332, 6174, 5315, -67, -225, -453, 0, 0, 0, 0, 0, 0, 0, 0, 0, "B");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		212, 312, 888, -4096, -344, -248, 0, 0, 0, 0, 0, 0, 
		5439, -7009, 12177, -5370, 6134, 4956, 123, 192, -414, 0, 0, 0, 0, 0, 0, 0, 0, 0, "C");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 50, 50, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		124, 312, 916, -4096, -330, -279, 0, 0, 0, 0, 0, 0, 
		4361, -7083, 12551, -5064, 6459, 5179, 214, 223, -517, 0, 0, 0, 0, 0, 0, 0, 0, 0, "D");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 100, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		252, 292, 912, -4096, -334, -267, 0, 0, 0, 0, 0, 0, 
		5416, -6760, 12295, -5109, 5938, 4978, 152, 114, -470, 0, 0, 0, 0, 0, 0, 0, 0, 0, "E");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		372, 244, 868, -4096, -319, -220, 0, 0, 0, 0, 0, 0, 
		4488, -6770, 12845, -5012, 5994, 5269, 84, 66, -486, 0, 0, 0, 0, 0, 0, 0, 0, 0, "F");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 
		-720, -148, 624, -4096, -120, -327, 0, 0, 0, 0, 0, 0, 
		-9456, -10131, 9335, 702, 9183, 5528, 4, -99, -322, 0, 0, 0, 0, 0, 0, 0, 0, 0, "G");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 
		-680, -108, 628, -4096, -129, -4096, 0, 0, 0, 0, 0, 0, 
		-6614, -10555, 10400, -747, 9161, 5661, 115, 131, -471, 0, 0, 0, 0, 0, 0, 0, 0, 0, "H");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 100, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		264, 336, 880, -4096, -351, -236, 0, 0, 0, 0, 0, 0, 
		5897, -5464, 12864, -5037, 5346, 4956, 203, -99, -185, 0, 0, 0, 0, 0, 0, 0, 0, 0, "I");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 100, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-108, 792, 588, -26, -529, -91, 0, 0, 0, 0, 0, 0, 
		-9077, 1722, 14136, 136, 3940, 5362, 223, 87, -658, 0, 0, 0, 0, 0, 0, 0, 0, 0, "J1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-664, 476, 480, 303, -406, -252, 0, 0, 0, 0, 0, 0, 
		-14939, -1318, 9342, 2926, 5995, 4807, -12, 120, -606, 0, 0, 0, 0, 0, 0, 0, 0, 0, "J2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-852, 216, 376, 483, -287, -228, 0, 0, 0, 0, 0, 0, 
		-18215, -2406, 1618, 4987, 6842, 2650, 151, 34, -462, 0, 0, 0, 0, 0, 0, 0, 0, 0, "J3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 100, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		408, 436, 776, -4096, -381, -161, 0, 0, 0, 0, 0, 0, 
		6276, -1754, 13725, -5074, 4012, 4706, 124, 174, -476, 0, 0, 0, 0, 0, 0, 0, 0, 0, "K");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 50, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		260, 404, 852, -4096, -368, -232, 0, 0, 0, 0, 0, 0, 
		5974, -3242, 13355, -4758, 4693, 4805, 281, 182, -509, 0, 0, 0, 0, 0, 0, 0, 0, 0, "L");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		480, 356, 776, -4096, -310, -162, 0, 0, 0, 0, 0, 0, 
		4367, -2006, 14172, -4584, 4345, 4525, 125, 205, -516, 0, 0, 0, 0, 0, 0, 0, 0, 0, "M");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 
		292, 376, 852, -4096, -308, -234, 0, 0, 0, 0, 0, 0, 
		2984, -3011, 14841, -4160, 4919, 4753, 139, 12, -480, 0, 0, 0, 0, 0, 0, 0, 0, 0, "N");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		68, 524, 812, -4096, -399, -213, 0, 0, 0, 0, 0, 0, 
		2029, -4253, 14638, -4103, 5246, 5017, 130, 112, -285, 0, 0, 0, 0, 0, 0, 0, 0, 0, "O");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		560, 176, 780, -4096, -237, -157, 0, 0, 0, 0, 0, 0, 
		3098, -6043, 13803, -3960, 5743, 4982, 87, 77, -531, 0, 0, 0, 0, 0, 0, 0, 0, 0, "P");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		256, 140, 916, -4096, -225, -4096, 0, 0, 0, 0, 0, 0, 
		-7339, -1260, 14759, -226, 5212, 6044, 189, -244, -127, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Q");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		188, 272, 924, -190, -156, -338, 0, 0, 0, 0, 0, 0, 
		-4086, -1916, 15568, -1301, 5729, 5506, 49, 148, -555, 0, 0, 0, 0, 0, 0, 0, 0, 0, "R");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 100, 50, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-160, 288, 892, 66, -396, -480, 0, 0, 0, 0, 0, 0, 
		-6030, -2829, 14779, 777, 5824, 4593, 113, 155, -395, 0, 0, 0, 0, 0, 0, 0, 0, 0, "S");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		128, 444, 880, -161, -450, -395, 0, 0, 0, 0, 0, 0, 
		-5421, 267, 15334, 635, 5921, 4752, 191, 121, -566, 0, 0, 0, 0, 0, 0, 0, 0, 0, "T");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		100, 200, 940, -83, -19, -465, 0, 0, 0, 0, 0, 0, 
		-4598, -3711, 15166, -350, 5889, 5399, 45, 107, -555, 0, 0, 0, 0, 0, 0, 0, 0, 0, "U");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		324, 260, 856, -314, -244, -276, 0, 0, 0, 0, 0, 0, 
		-1172, -2427, 15301, -2966, 6559, 5655, 266, 703, -583, 0, 0, 0, 0, 0, 0, 0, 0, 0, "V");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		404, 556, 688, -303, -343, -127, 0, 0, 0, 0, 0, 0, 
		-1757, -1373, 15573, -2986, 5532, 5527, 49, 26, -476, 0, 0, 0, 0, 0, 0, 0, 0, 0, "W");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		112, 328, 916, -100, -243, -291, 0, 0, 0, 0, 0, 0, 
		-1189, -2333, 15773, -2323, 5583, 5631, -149, 1, -406, 0, 0, 0, 0, 0, 0, 0, 0, 0, "X");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		72, 592, 780, -148, -414, -273, 0, 0, 0, 0, 0, 0, 
		-3564, 728, 15723, -1369, 4891, 5704, 179, 132, -560, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Y");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 50, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		136, 568, 788, -216, -392, -223, 0, 0, 0, 0, 0, 0, 
		-4317, 1348, 15520, -1699, 4657, 5543, -20, -17, -548, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Z1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 50, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-20, 648, 720, -34, -489, -251, 0, 0, 0, 0, 0, 0, 
		-7933, 2640, 14466, 551, 5049, 4636, 113, -15, -690, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Z2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 50, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		60, 412, 884, -206, -316, -330, 0, 0, 0, 0, 0, 0, 
		-5635, -1131, 15238, -1019, 6383, 6741, 830, 721, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Z3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 50, 50, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		64, 436, 852, -118, -395, -308, 0, 0, 0, 0, 0, 0, 
		-5960, 699, 15414, -717, 5237, 5705, 140, 178, -415, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Z4");
