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
	VALUES("right", 0, 30, 60, 80, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-452, 472, 764, 481, -308, -458, 32, 504, 848, 320, -157, -261, 
		-9827, 4646, 13578, 3527, 4639, 4014, 191, 404, -278, 1390, -3165, 15131, 871, 8770, 4570, 311, 384, -508, "1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 20, 10, 60, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-264, 576, 776, 426, -459, -523, 112, 500, 828, 291, -202, -287, 
		-7319, 6490, 14249, 2636, 3792, 4949, -82, 427, -188, 2632, -2107, 14976, 373, 8539, 5225, 91, 181, -369, "2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 10, 70, 60, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 
		-528, 404, 788, 525, -290, -445, -40, 532, 820, 367, -155, -257, 
		-12436, 4111, 11839, 4186, 5126, 3055, 401, 408, -115, 481, -3830, 15725, 1908, 8633, 3986, 135, 169, -503, "3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 
		-204, 88, 996, 209, -138, -530, 184, 308, 916, 235, -78, -363, 
		-1434, 232, 16858, 418, 6062, 5740, -171, 618, -262, 670, -4354, 15055, 1578, 9423, 4768, -89, 152, -426, "4");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 90, 90, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-128, 12, 1012, 191, -90, -562, 144, 256, 924, 251, -59, -354, 
		-2916, -1907, 16475, 684, 7016, 5402, 135, 339, -282, -526, -4971, 14887, 1874, 9815, 4503, 192, 230, -516, "5");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 20, 50, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 
		-120, 488, 860, 217, -383, -562, 152, 492, 840, 256, -185, -329, 
		-7951, 5119, 14560, 2967, 4336, 4621, 127, 432, -293, 799, -3565, 15299, 1613, 9054, 4839, 10, 133, -457, "6");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 
		-300, 504, 820, 335, -372, -523, 24, 528, 828, 348, -188, -277, 
		-9568, 5186, 13731, 3185, 4636, 4551, -11, 451, -349, -322, -4197, 15149, 1839, 8241, 3646, -88, 2, -454, "7");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-248, 508, 840, 278, -350, -526, 92, 528, 816, 302, -201, -286, 
		-9295, 5201, 13803, 3241, 4579, 4448, 14, 395, -280, 49, -3207, 15302, 1148, 8257, 4144, 9, 161, -434, "8");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 30, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-252, 404, 888, 251, -294, -547, 120, 500, 828, 266, -182, -315, 
		-8377, 3658, 14898, 2709, 5086, 4913, -15, 369, -313, -237, -3745, 15315, 1453, 8422, 4193, -66, 68, -411, "9");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 90, 90, 90, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 
		-452, 284, 856, 452, -147, -483, -24, 368, 908, 320, -66, -301, 
		-8702, 2186, 14981, 2808, 5899, 4591, -18, 201, -234, -242, -3097, 15402, 971, 8990, 4827, -20, 37, -350, "A");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		-244, 196, 964, 249, -167, -566, -32, 300, 928, 318, -40, -345, 
		-8009, 1302, 15147, 2533, 6216, 4907, 57, 281, -240, -948, -3140, 15378, 1385, 9251, 5125, 35, 61, -440, "B");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 40, 50, 60, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		-184, 628, 756, 268, -453, -531, -8, 504, 836, 304, -168, -331, 
		-7354, 8594, 12942, 2470, 3055, 4857, 209, 358, -289, -222, -1657, 15627, 1814, 8778, 5184, 69, 180, -411, "C");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 60, 80, 70, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-356, 576, 744, 412, -396, -484, -108, 476, 816, 359, -141, -307, 
		-10050, 6128, 12716, 3664, 4320, 4062, -4, 629, -201, -1579, -2261, 15539, 2468, 9044, 4705, 55, 154, -270, "D");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 80, 80, 90, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
		-400, 664, 628, 426, -418, -439, -72, 540, 808, 345, -171, -289, 
		-9791, 8683, 11523, 3427, 3236, 3846, 64, 437, -269, -556, -1465, 15759, 1796, 8157, 4613, 25, 209, -400, "E");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-340, 568, 768, 347, -391, -545, -104, 472, 844, 365, -117, -307, 
		-10352, 7037, 12201, 3647, 3950, 3802, 89, 390, -291, -1120, -2423, 15562, 1845, 8532, 4100, 59, 208, -474, "F");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 30, 60, 80, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-964, 40, 312, 581, 22, -127, -700, 160, 644, 583, 145, -32, 
		-16672, -1370, 5670, 4656, 7159, -295, 202, 262, -271, -11747, -5504, 11186, 4581, 9502, 1171, 77, -14, -523, "G");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 10, 70, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-876, 156, 544, 612, -42, -278, -596, 212, 712, 573, 100, -74, 
		-16101, -1074, 7350, 4716, 7158, 783, -43, 454, -346, -9911, -5652, 12427, 4193, 9540, 2002, 5, 134, -469, "H");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 40, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-356, 716, 608, 464, -427, -378, 60, 608, 760, 280, -220, -300, 
		-8401, 10190, 10863, 3048, 2515, 3948, 132, 232, -103, -1244, -1557, 15475, 1334, 7947, 4905, 96, 56, -379, "I");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 60, 50, 60, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-564, 628, 544, 460, -372, -377, -168, 596, 756, 413, -189, -211, 
		-11256, 8649, 10046, 3508, 3536, 3806, 133, 383, -292, -2772, -2955, 15451, 2044, 8065, 4028, 61, 116, -411, "J1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 60, 50, 60, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-920, 100, 416, 518, 1, -186, -692, 308, 592, 585, 47, -5, 
		-16739, 399, 5549, 4213, 7397, 668, 61, 303, -204, -11342, -5098, 11729, 3987, 8747, 1735, 27, 34, -480, "J2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 60, 40, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-948, -264, -276, 301, 111, 293, -972, -120, -52, 524, 259, 403, 
		-15889, -2674, -7300, 1821, 7089, -4920, 89, 367, -238, -17832, -2921, 2530, 5051, 7571, -2422, 56, 123, -396, "J3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 10, 70, 70, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 
		-424, 688, 632, 442, -428, -424, -36, 576, 784, 327, -177, -306, 
		-9629, 7794, 12432, 3368, 3532, 4024, -76, 302, -342, -82, -1058, 15594, 1435, 8287, 4935, -9, 100, -477, "K");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 20, 90, 90, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
		-480, 632, 620, 472, -368, -425, -52, 608, 788, 349, -173, -274, 
		-9638, 8608, 11611, 3243, 3450, 4067, 121, 405, -331, -66, -2014, 15610, 1126, 8491, 4702, 71, 235, -481, "L");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 90, 60, 70, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-356, 472, 812, 413, -293, -442, 40, 452, 860, 302, -131, -321, 
		-9939, 4802, 13661, 3398, 4750, 4404, 78, 490, -231, -517, -1058, 15729, 1485, 8066, 4995, 58, 85, -431, "M");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 70, 70, 80, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-388, 400, 832, 425, -279, -460, 0, 416, 900, 313, -100, -326, 
		-9488, 4416, 13891, 3181, 4898, 4570, -28, 660, -227, -555, -2651, 15486, 1540, 8643, 4794, 96, 509, -275, "N");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 50, 60, 70, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-420, 664, 620, 458, -507, -360, -136, 584, 772, 428, -205, -226, 
		-10558, 8956, 10913, 3807, 2833, 3149, 185, 605, -456, -2115, -1338, 15947, 2764, 7919, 4121, 113, 556, -437, "O");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 40, 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-84, 68, 1008, 206, -99, -564, -72, 188, 960, 380, -38, -311, 
		-7904, -24, 15465, 2593, 6368, 4777, 75, 267, -182, -2580, -3215, 15487, 2405, 8517, 4790, 38, -55, -501, "P");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 20, 50, 60, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 
		-152, -512, 868, 345, 225, -399, -84, 40, 964, 382, -86, -273, 
		-6139, -10373, 11927, 2240, 9258, 2218, 182, 412, -207, -7890, -2945, 14460, 3667, 7445, 3464, 100, 168, -458, "Q");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 10, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-160, 480, 908, 339, -367, -580, 144, 428, 876, 245, -120, -332, 
		-8317, 4312, 14743, 3074, 4491, 4554, -167, 173, -216, 2812, -4056, 14552, 539, 9282, 4852, 240, 130, -384, "R");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 60, 60, 80, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		-244, 668, 724, 341, -442, -460, 200, 544, 800, 231, -190, -295, 
		-8401, 8446, 12541, 2941, 3116, 4196, 40, 394, -264, 3607, -2452, 14670, 38, 8424, 4977, 32, 160, -410, "S");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 40, 50, 60, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 
		-180, 580, 804, 326, -444, -513, 272, 464, 812, 184, -181, -317, 
		-7384, 6854, 13978, 2752, 3415, 4573, 85, 302, -277, 3425, -2291, 14733, -106, 8573, 5241, -41, -26, -423, "T");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 10, 60, 70, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-192, 580, 792, 377, -432, -565, 192, 484, 824, 253, -177, -311, 
		-6982, 6129, 14199, 2485, 3938, 5179, 18, 383, -300, 3371, -2391, 14748, 268, 8955, 5175, -49, 122, -410, "U");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 10, 60, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-332, 604, 716, 425, -478, -513, 40, 508, 816, 319, -180, -277, 
		-7337, 6561, 14439, 2413, 3756, 5125, -156, 230, -100, 1948, -2542, 15275, 1246, 8849, 4853, 166, 205, -318, "V");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-176, 616, 772, 267, -492, -575, 100, 528, 812, 300, -206, -288, 
		-8589, 7607, 13328, 3101, 3205, 4450, 123, 382, -307, 2196, -1836, 15397, 1040, 8531, 5160, -60, 263, -484, "W");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 40, 60, 80, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-380, 488, 780, 462, -326, -515, 96, 484, 856, 269, -166, -296, 
		-9521, 4242, 13530, 3580, 4732, 4060, -61, 268, -244, 1860, -2451, 14793, 499, 8693, 5052, 55, 104, -316, "X");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 60, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 
		-388, 520, 788, 466, -258, -483, 108, 572, 780, 279, -183, -274, 
		-7427, 7040, 13769, 2476, 3989, 4942, 322, 201, -167, 1734, -1892, 15275, 354, 8307, 4870, 19, -66, -462, "Y");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 80, 80, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-368, 548, 772, 454, -386, -440, 48, 572, 792, 350, -253, -279, 
		-8778, 6362, 13561, 3107, 3815, 4546, 100, 378, -174, 41, -1023, 15700, 1425, 7777, 5616, 29, 102, -397, "Z1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 80, 80, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-500, 504, 728, 482, -317, -451, -72, 556, 812, 365, -217, -270, 
		-10157, 5491, 13109, 3515, 4454, 3877, 57, 344, -266, -1444, -2406, 15663, 2021, 8462, 5019, 28, 146, -446, "Z2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 0, 80, 80, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-448, 208, 884, 470, -166, -446, 48, 336, 920, 310, -96, -325, 
		-8188, 555, 15271, 2915, 6148, 4392, 134, 366, -261, -244, -5635, 14719, 1841, 9251, 4557, 66, 27, -457, "Z3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex,
		th_con_t, in_con_t, mi_con_t, ri_con_t, pi_con_t, ti_con_t, im_con_t, mr_con_t, rp_con_t, in_con_m, mi_con_m, ri_con_m, pi_con_m,
		accel_303_0_x, accel_303_0_y, accel_303_0_z, mag_303_0_x, mag_303_0_y, mag_303_0_z,
		accel_303_1_x, accel_303_1_y, accel_303_1_z, mag_303_1_x, mag_303_1_y, mag_303_1_z,
		accel_9dof_0_x, accel_9dof_0_y, accel_9dof_0_z, mag_9dof_0_x, mag_9dof_0_y, mag_9dof_0_z, gyro_9dof_0_x, gyro_9dof_0_y, gyro_9dof_0_z,
		accel_9dof_1_x, accel_9dof_1_y, accel_9dof_1_z, mag_9dof_1_x, mag_9dof_1_y, mag_9dof_1_z, gyro_9dof_1_x, gyro_9dof_1_y, gyro_9dof_1_z,gest)
	VALUES("right", 0, 10, 80, 80, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
		-452, 220, 892, 446, -119, -499, -12, 348, 916, 314, -44, -287, 
		-9092, 1064, 14845, 2493, 6499, 4920, 116, 331, -234, -962, -5849, 14768, 1530, 9559, 3425, 87, 109, -479, "Z4");
