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
	VALUES("right", 0, 10, 95, 95, 85, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-644, 604, 464, 529, -390, -110, -256, 532, 780, 470, -173, -217, 
		-12190, 5646, 11263, 4467, 4561, 2751, 73, 434, -253, -5481, -3160, 14996, 3318, 8607, 4124, 83, 123, -437, "1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 75, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-572, 592, 548, 553, -445, -155, -168, 508, 808, 433, -172, -249, 
		-10735, 5969, 12438, 4095, 4469, 3470, -187, 586, -404, -4943, -2824, 15314, 3191, 8466, 4282, -90, 163, -431, "2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 85, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-736, 524, 456, 578, -300, -79, -304, 484, 792, 494, -116, -216, 
		-12696, 4457, 12006, 4262, 5408, 3009, 19, 313, -371, -6122, -4081, 14949, 3503, 9003, 3814, 103, 294, -486, "3");
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
	VALUES("right", 0, 55, 85, 95, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-684, 576, 480, 685, -116, -236, -448, 472, 736, 564, -113, -141, 
		-12854, 7278, 9713, 4528, 4571, 2607, 97, 408, -259, -8982, -1590, 14283, 4248, 8436, 3297, 89, 5, -477, "C");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 85, 95, 65, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-704, 560, 476, 634, -158, -91, -428, 468, 760, 560, -122, -154, 
		-12837, 6051, 10412, 4666, 4565, 2417, 49, 325, -225, -9558, -750, 13855, 4440, 8085, 3187, 88, 61, -408, "D");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 85, 95, 95, 80, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-708, 620, 348, 641, -238, -86, -416, 544, 700, 556, -171, -135, 
		-12566, 8560, 8829, 4611, 3767, 2254, 141, 403, -280, -8980, -144, 14240, 4284, 7912, 3429, 88, 151, -351, "E");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 45, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-624, 564, 564, 572, -264, -205, -344, 504, 740, 535, -153, -181, 
		-14287, 6716, 7625, 5052, 4257, 1049, 112, 302, -240, -9155, -645, 13892, 4224, 7950, 3338, 183, 51, -344, "F");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 95, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-1028, 24, 48, 647, 194, 33, -856, 12, 436, 639, 152, 141, 
		-17561, -777, 1528, 4310, 7323, -1975, 125, 305, -159, -16233, -3219, 6599, 5444, 8834, -646, 63, 49, -395, "G");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 85, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-1004, 40, 148, 670, 163, 0, -796, 32, 528, 643, 131, 80, 
		-17496, -359, 2959, 4539, 6920, -1728, 163, 224, -337, -16287, -2727, 6989, 5525, 8651, -665, 93, 42, -489, "H");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 45, 60, 75, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-664, 640, 388, 690, -263, -247, -416, 508, 720, 549, -158, -153, 
		-13180, 8906, 7705, 4723, 3717, 1785, 112, 395, -191, -9872, 527, 13971, 3951, 7181, 3430, 58, 23, -385, "I");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 70, 80, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-688, 672, 300, 622, -260, -212, -496, 508, 640, 561, -176, -70, 
		-13901, 9425, 5157, 4758, 4044, 1262, 153, 201, -275, -9098, -1393, 14195, 3673, 7808, 3484, 42, 197, -359, "J1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 65, 75, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-1012, -36, 208, 499, 167, -39, -912, 120, 264, 611, 113, 204, 
		-17505, -2455, 1859, 3585, 8952, -627, 85, 415, -242, -15759, -3338, 7561, 5190, 8569, -275, 49, 40, -461, "J2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 70, 75, 70, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-864, -156, -512, 237, 136, 379, -940, -140, -260, 447, 197, 498, 
		-14995, -1580, -9267, 1106, 6735, -5496, 95, 517, -290, -18264, -2708, -1043, 4242, 8268, -3499, -68, 304, -437, "J3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 90, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-712, 472, 536, 596, -205, -149, -376, 392, 804, 538, -68, -210, 
		-13099, 5508, 10686, 4549, 5001, 2602, 197, 441, -252, -9660, -993, 13973, 4482, 8257, 3216, 84, 69, -451, "K");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 95, 95, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-672, 372, 652, 496, -252, -41, -324, 296, 884, 515, -35, -229, 
		-11224, 3880, 13080, 4137, 5163, 3296, 139, 803, -463, -8568, -2217, 14238, 4212, 8561, 3393, 31, 315, -558, "L");
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
	VALUES("right", 0, 65, 70, 90, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-600, 436, 688, 598, -147, -283, -220, 332, 892, 465, -65, -272, 
		-7982, 4788, 14619, 3110, 4820, 4664, 116, 451, -233, -8092, -2467, 14405, 4004, 8389, 3529, 79, 142, -425, "N");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 55, 70, 85, 45, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-636, 712, 296, 533, -412, -151, -408, 508, 708, 558, -147, -152, 
		-10434, 9684, 10166, 4152, 3028, 3037, 50, 382, -316, -8420, -410, 14503, 4137, 7790, 3643, 104, 160, -417, "O");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 45, 45, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-268, 128, 980, 373, -86, -471, 144, -40, 964, 270, 128, -356, 
		-3630, -1687, 16664, 1558, 6964, 5167, 18, 399, -240, -584, -6471, 14291, 2000, 10142, 4451, 98, 72, -442, "P");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 30, 95, 95, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-264, -656, 728, 410, 344, -159, 264, -412, 848, 217, 314, -298, 
		-4250, -12217, 10618, 1945, 10023, 1228, 80, 359, -278, -1791, -8686, 13215, 2409, 10694, 3874, 34, 89, -439, "Q");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 90, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-476, 676, 592, 448, -429, -258, -28, 516, 812, 355, -187, -294, 
		-9919, 6209, 12873, 3894, 4293, 3799, 28, 330, -303, -2082, -4274, 15270, 2276, 9150, 4600, 43, 186, -368, "R");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 70, 70, 85, 75, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-576, 716, 412, 637, -238, -276, -248, 608, 732, 451, -193, -215, 
		-12528, 8157, 9110, 4487, 4027, 2302, 97, 278, -229, -5511, -3288, 14857, 3177, 8850, 4036, 93, 170, -451, "S");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 65, 85, 75, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-528, 780, 320, 514, -378, -145, -176, 688, 692, 424, -251, -213, 
		-12476, 9559, 7659, 4549, 3183, 1557, 237, 395, -197, -3971, -2898, 15385, 2787, 8582, 4448, 75, 150, -384, "T");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 95, 70, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-532, 788, 380, 492, -473, -210, -84, 624, 764, 387, -225, -260, 
		-11218, 8318, 10727, 4314, 3565, 3040, -52, 539, -409, -3159, -2941, 15604, 2534, 8556, 4680, -52, 208, -450, "U");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 90, 65, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-540, 676, 508, 487, -490, -157, -92, 556, 792, 393, -193, -275, 
		-9672, 6923, 12596, 3703, 4196, 4073, 199, 410, -137, -3792, -2875, 15376, 2795, 8607, 4563, 118, 63, -284, "V");
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
	VALUES("right", 0, 65, 95, 95, 75, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-632, 596, 492, 511, -408, -201, -176, 552, 780, 442, -191, -228, 
		-11568, 5667, 11371, 4470, 4572, 2781, 305, 398, -49, -3375, -3972, 14979, 2754, 8860, 4456, 200, 87, -435, "X");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 65, 70, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-680, 568, 476, 613, -181, -239, -312, 556, 732, 490, -174, -185, 
		-11715, 7262, 10826, 4159, 4506, 3072, 200, 413, -253, -5804, -3986, 14739, 3252, 8876, 3833, 103, 164, -481, "Y");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 90, 95, 85, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-508, 240, 840, 406, -223, -150, -84, 256, 936, 386, -86, -306, 
		-8218, 2196, 15088, 3058, 5223, 4377, 110, 403, -180, -2700, -2419, 15620, 2595, 8220, 5003, 80, 112, -385, "Z1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 90, 95, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-560, 96, 852, 418, 3, -213, -184, 176, 952, 413, 40, -292, 
		-8381, -319, 15302, 2197, 7314, 4445, 316, 397, -229, -5079, -2980, 15244, 3162, 9089, 4355, 98, 105, -383, "Z2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 90, 95, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-692, -160, 764, 460, -31, -46, -336, -28, 884, 486, 73, -213, 
		-12030, -4326, 11868, 3751, 7744, 1790, 27, 298, -281, -7019, -5055, 13974, 3833, 9061, 3436, 73, 86, -507, "Z3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 90, 95, 85, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-488, -140, 904, 346, 113, -359, -160, -120, 948, 369, 213, -243, 
		-7386, -4549, 14691, 1584, 8913, 3517, 41, 208, -207, -3822, -7177, 13816, 2485, 10567, 3271, 33, 80, -299, "Z4");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, in_con_m, mi_con_t, mi_con_m, ri_con_t, ri_con_m, pi_con_t, pi_con_m, ti_con_t, im_con_t, mr_con_t, rp_con_t,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-128, 12, 1012, 191, -90, -562, 144, 256, 924, 251, -59, -354, 
		-2916, -1907, 16475, 684, 7016, 5402, 135, 339, -282, -526, -4971, 14887, 1874, 9815, 4503, 192, 230, -516, " ");
