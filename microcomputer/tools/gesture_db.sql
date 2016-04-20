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
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 35, 95, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-304, 444, 864, 365, -624, -459, 216, 288, 912, 173, -340, -284, 
		-8176, 6591, 13403, 1301, -127, 3507, 52, 347, -262, -10775, -798, 13186, 3057, 3692, 3106, 1, 241, -540, "1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 10, 85, 95, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-316, 404, 856, 362, -612, -478, 196, 272, 924, 184, -349, -283, 
		-10141, 5291, 13542, 1683, 170, 3485, 89, 365, -238, -10550, -1367, 13249, 2889, 3702, 3362, 22, -3, -365, "2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 5, 5, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-316, 424, 840, 368, -606, -468, 252, 200, 928, 143, -317, -312, 
		-8672, 5572, 13704, 1481, 161, 3654, 282, 437, -266, -10492, -801, 13293, 2915, 3528, 3201, -2, 198, -546, "3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
		-204, 88, 996, 209, -138, -530, 184, 308, 916, 235, -78, -363, 
		-1434, 232, 16858, 418, 6062, 5740, -171, 618, -262, 670, -4354, 15055, 1578, 9423, 4768, -89, 152, -426, "4");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-128, 12, 1012, 191, -90, -562, 144, 256, 924, 251, -59, -354, 
		-2916, -1907, 16475, 684, 7016, 5402, 135, 339, -282, -526, -4971, 14887, 1874, 9815, 4503, 192, 230, -516, "5");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 15, 50, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 
		-604, 592, 556, 547, -252, -222, -496, 412, 732, 554, -92, -134, 
		-14897, 6751, 6893, 4833, 4688, 1046, 131, 349, -160, -7677, -4444, 14081, 3908, 8838, 3283, 207, 99, -405, "6");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 
		-576, 536, 624, 488, -269, -193, -440, 392, 756, 547, -105, -154, 
		-14136, 5997, 8838, 4630, 4982, 2002, 177, 469, -363, -7736, -3507, 14338, 3700, 8483, 3449, 27, 408, -365, "7");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 60, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-636, 576, 512, 555, -245, -186, -500, 404, 740, 564, -105, -114, 
		-14640, 6086, 8086, 4846, 4929, 1437, 390, 540, -406, -7618, -3134, 14419, 3530, 8335, 3495, 92, 333, -540, "8");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 45, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-676, 520, 520, 634, -172, -222, -548, 368, 704, 585, -84, -92, 
		-14906, 5177, 7946, 4872, 5140, 1230, 112, 390, -261, -8649, -3057, 13971, 3734, 8227, 3144, 34, 164, -414, "9");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 90, 95, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 
		-696, 392, 620, 738, -132, -294, -508, 352, 764, 583, -63, -121, 
		-13885, 5905, 9067, 4804, 5023, 1892, 37, 346, -215, -9616, -373, 13876, 4367, 8054, 3188, 53, 78, -376, "A");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		-692, 452, 612, 560, -290, -197, -360, 432, 780, 545, -109, -190, 
		-13806, 5002, 9507, 4911, 5043, 1832, 48, 475, -229, -8571, -881, 14277, 4231, 8247, 3448, 124, 90, -377, "B");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 75, 65, 95, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		-412, 536, 736, 355, -696, -369, -524, 248, 768, 476, -373, -142, 
		-11268, 8691, 10396, 1849, -1011, 1684, 220, 399, -271, -13205, -1472, 11182, 4095, 4226, 3661, 175, 152, -402, "C");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 15, 75, 95, 95, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-520, 456, 724, 419, -647, -376, -528, 328, 736, 471, -399, -111, 
		-12255, 7356, 10113, 2363, -617, 1748, 61, 379, -250, -13615, -2524, 10550, 4359, 4609, 3665, 70, 139, -419, "D");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 95, 90, 95, 95, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		-592, 448, 672, 433, -656, -341, -452, 372, 768, 434, -422, -126, 
		-12273, 7415, 10119, 2411, -604, 1680, 102, 425, -261, -12960, -2834, 11152, 4258, 4756, 3873, 58, 170, -380, "E");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 75, 10, 0, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 
		-516, 452, 724, 428, -642, -371, -480, 364, 740, 451, -418, -115, 
		-12811, 7796, 9348, 2558, -594, 1223, 4, 395, -166, -13980, -2813, 10238, 4563, 4706, 3429, 102, 107, -328, "F");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 35, 80, 95, 95, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-1008, 64, 48, 609, -438, -47, -872, 60, 404, 641, -241, 87, 
		-17673, 1875, -1172, 3868, 1207, -1766, -7, 451, -298, -17619, -3571, 2908, 5711, 5051, 708, -101, 41, -323, "G");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 5, 10, 90, 95, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-948, 128, 316, 612, -501, -187, -768, 120, 556, 591, -311, -29, 
		-16844, 1889, 5409, 4112, 950, 991, 195, 661, -236, -16354, -3503, 6378, 5424, 5008, 2150, 140, 349, -499, "H");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 95, 70, 95, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 
		-684, 520, 516, 472, -649, -216, -600, 372, 656, 492, -420, -46, 
		-12286, 8344, 9011, 2510, -626, 1158, 153, 460, -259, -14789, -2869, 9184, 4931, 4816, 2987, 201, 433, -446, "I");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 80, 55, 85, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 
		-748, 688, 16, 342, -652, -30, -704, 660, 248, 375, -495, 137, 
		-13355, 11293, 1532, 461, -1142, -1183, 63, 518, -163, -16774, 1943, 6299, 3321, 3458, 3014, 47, 233, -240, "J1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 95, 70, 95, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 
		-976, -24, -300, 518, -362, 78, -976, -12, 32, 615, -198, 200, 
		-17258, 1258, -4654, 2983, 1804, -2482, 120, 490, -243, -16980, -21, -7617, 4823, 4489, -1366, 73, 110, -316, "J2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 95, 65, 90, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 
		-476, -172, -888, 250, -342, 275, -764, -288, -648, 483, -101, 511, 
		-10032, 2432, -14293, 362, 894, -4110, 467, 554, 56, -9467, 4811, -14567, 1867, 2547, -3597, 203, 60, -222, "J3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 5, 10, 95, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-716, 356, 596, 524, -594, -301, -556, 336, 708, 498, -399, -83, 
		-13903, 5322, 9267, 3296, 194, 1594, 104, 382, -236, -14902, -3324, 8883, 5087, 4997, 2921, 44, 237, -467, "K");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 95, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-668, 372, 660, 494, -611, -337, -508, 408, 732, 452, -431, -89, 
		-15183, 5527, 7279, 3182, -81, 947, 197, 376, -340, -13745, -4292, 9875, 4731, 5300, 3614, 93, 180, -403, "L");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 70, 70, 95, 85, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 
		-576, 568, 604, 608, -228, -336, -228, 472, 844, 458, -136, -261, 
		-11041, 6898, 12008, 4085, 4355, 3428, 95, 368, -165, -7500, -2105, 14710, 3824, 8300, 3857, 111, 98, -367, "M");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 90, 70, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-516, 508, 712, 379, -687, -346, -432, 416, 760, 405, -452, -120, 
		-12034, 7443, 10428, 1825, -981, 2020, 168, 424, -279, -12114, -4397, 11441, 4156, 5280, 4331, 101, 176, -397, "N");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 85, 60, 85, 50, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-716, 584, 388, 407, -697, -172, -636, 412, 588, 486, -440, -14, 
		-12513, 9160, 8100, 1602, -1318, 906, 187, 366, -182, -16519, -2018, 6806, 5068, 4332, 2301, 133, 129, -352, "O");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 5, 30, 25, 45, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-192, -80, 984, 14, -131, -588, 116, 224, 944, -172, -285, -259, 
		-6894, -4084, 15322, -2405, 7953, 3457, 185, 438, -224, -6332, -3840, 14703, -1401, 5684, 5952, 145, 184, -411, "P");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 90, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-228, -692, 728, -25, 101, -496, 124, -260, 936, -214, -21, -331, 
		-4827, -12607, 9841, -3737, 6851, 3087, 49, 319, -156, -3596, -9910, 12268, -2225, 8291, 5566, 68, 198, -404, "Q");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 10, 95, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-320, 612, 740, 182, -685, -403, -64, 672, 692, 78, -510, -61, 
		-9748, 9880, 10390, -285, -1198, 2131, -6, 552, -373, -9907, 2576, 13592, 1081, 2919, 4306, -43, 223, -443, "R");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 95, 95, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		-460, 764, 460, 176, -715, -268, -284, 724, 604, 178, -517, 5, 
		-9892, 11707, 8045, -931, -1541, 1392, 144, 365, -258, -11910, 2326, 12341, 1569, 3067, 4075, 70, 169, -407, "S");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 70, 75, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-604, 560, 564, 263, -656, -370, -436, 644, 588, 242, -500, -6, 
		-12612, 8568, 8706, 198, -820, 2149, 158, 371, -299, -13812, 2888, 10519, 2081, 2856, 3425, 131, 136, -403, "T");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 5, 10, 95, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-432, 536, 732, 187, -658, -440, -128, 696, 676, 106, -507, -36, 
		-10336, 8235, 11251, -303, -822, 2866, 88, 331, -233, -10527, 2323, 13279, 1156, 3017, 4261, 38, 116, -390, "U");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 5, 5, 85, 65, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-440, 588, 696, 195, -668, -409, -192, 704, 640, 137, -508, -25, 
		-10612, 9318, 10215, -288, -1042, 2300, 109, 421, -340, -10814, 2623, 13041, 1235, 2958, 4098, 84, 198, -435, "V");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-436, 740, 524, 493, -420, -169, 16, 544, 804, 350, -224, -289, 
		-10733, 7503, 11921, 4199, 3666, 3283, 207, 573, -342, -2738, -3139, 15588, 2480, 8412, 4839, 65, 190, -450, "W");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 80, 90, 95, 75, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-540, 648, 536, 228, -715, -342, -296, 712, 600, 135, -504, -24, 
		-12100, 9246, 8799, -420, -1232, 2330, 194, 321, -136, -12091, 2835, 12188, 1115, 3013, 4034, 132, 119, -361, "X");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 90, 65, 95, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 
		-608, 596, 544, 253, -683, -362, -396, 668, 588, 209, -486, -8, 
		-11852, 8906, 9234, 45, -978, 2102, 198, 451, -170, -13038, 2674, 11394, 1676, 2970, 3658, 190, 149, -365, "Y");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 20, 65, 95, 95, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-388, 524, 764, 112, -613, -511, -64, 740, 628, 0, -554, -47, 
		-10008, 9586, 10473, -1325, -775, 3837, 129, 357, -198, -11449, -1299, 12753, 1475, 4513, 5414, 190, 153, -384, "Z1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 15, 60, 95, 95, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-500, 360, 832, 231, -582, -538, -124, 652, 736, 77, -529, -102, 
		-12217, 6858, 11005, 217, -362, 3707, 121, 364, -103, -12309, -1655, 12324, 2276, 4513, 4926, 109, 20, -305, "Z2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 15, 65, 95, 95, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-380, -68, 928, 90, -217, -684, -52, 344, 904, -73, -367, -272, 
		-9678, -195, 14550, -1030, 4190, 6187, 83, 369, -199, -7224, -3901, 14415, -432, 5495, 6185, 152, 153, -386, "Z3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 15, 65, 95, 95, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-428, -156, 920, 171, -241, -712, -48, 304, 940, 4, -383, -275, 
		-11547, -1974, 13032, 439, 3110, 5833, 188, 417, -71, -10636, -3009, 13045, 1684, 5019, 5470, 147, 137, -331, "Z4");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-128, 12, 1012, 191, -90, -562, 144, 256, 924, 251, -59, -354, 
		-2916, -1907, 16475, 684, 7016, 5402, 135, 339, -282, -526, -4971, 14887, 1874, 9815, 4503, 192, 230, -516, " ");