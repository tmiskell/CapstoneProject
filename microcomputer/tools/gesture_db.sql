/* Create the table. */
/* Key: */ 
/*        hand:		The hand, either left or right. */
/*        th_flex: 	The thumb flex sensor value. */
/*        in_flex: 	The index finger flex sensor value. */
/*        mi_flex: 	The middle finger flex sensor value. */ 
/*        ri_flex: 	The ring finger flex sensor value. */ 
/*        pi_flex: 	The pinky finger flex sensor value. */ 
/*        th_con:	The thumb contact sensor value. */
/*        in_con:  	The index finger contact sensor value. */
/*        mi_con:	The middle finger contact sensor value. */
/*        ri_con:	The ring finger contact sensor value. */
/*        pi_con:	The pinky finger contact sensor value. */
/*        ti_con:	The thumb-index interdigital fold contact sensor value. */
/*        im_con:	The index-middle interdigital fold contact sensor value. */
/*        mr_con:	The middle-ring interdigital fold contact sensor value. */
/*        rp_con:	The ring-pinky interdigital fold contact sensor value. */
/*        accel_x:      X axis accelerometer value. */
/*        accel_y:      X axis accelerometer value. */
/*        accel_z:      X axis accelerometer value. */
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
   th_con BOOLEAN NOT NULL,
   in_con BOOLEAN NOT NULL,
   mi_con BOOLEAN NOT NULL,
   ri_con BOOLEAN NOT NULL,
   pi_con BOOLEAN NOT NULL,
   ti_con BOOLEAN NOT NULL,
   im_con BOOLEAN NOT NULL,
   mr_con BOOLEAN NOT NULL,
   rp_con BOOLEAN NOT NULL,
   accel_x DOUBLE NOT NULL,
   accel_y DOUBLE NOT NULL,
   accel_z DOUBLE NOT NULL,
   gest VARCHAR(100), 
   in_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY ( id )
   );
/* Add entries to the table. Omit J and Z for now as they contain movement. */
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, " ");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0.0, 0.0, 0.0, "A");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 100.0, 100.0, 100.0, 100.0, 100.0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0.0, 0.0, 0.0, "B");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 50.0, 50.0, 50.0, 50.0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0.0, 0.0, 0.0, "C");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0.0, 0.0, 0.0, "D");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.0, 0.0, 0.0, "E");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 0.0, 100.0, 100.0, 100.0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0.0, 0.0, 0.0, "F");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0.0, 0.0, 0.0, "G");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 0.0, 0.0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0.0, 0.0, 0.0, "H");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 100.0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0.0, 0.0, 0.0, "I");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 0.0, 0.0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0.0, 0.0, 0.0, "K");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 100.0, 100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0.0, 0.0, 0.0, "L");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0.0, 0.0, 0.0, "M");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0.0, 0.0, 0.0, "N");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 50.0, 50.0, 50.0, 50.0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0.0, 0.0, 0.0, "O");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 100.0, 100.0, 50.0, 50.0, 50.0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0.0, 0.0, 0.0, "P");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0.0, 0.0, 0.0, "Q");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0.0, 0.0, 0.0, "R");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0.0, 0.0, 0.0, "S");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0.0, 0.0, 0.0, "T");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0.0, 0.0, 0.0, "U");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 25.0, 25.0, 25.0, "V");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 100.0, 0.0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0.0, 0.0, 0.0, "W");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 50.0, 0.0, 0.0, 0.0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0.0, 0.0, 0.0, "X");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 100.0, 0.0, 0.0, 0.0, 100.0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0.0, 0.0, 0.0, "Y");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 50.0, 50.0, 50.0, 50.0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0.0, 0.0, 0.0, "0");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 0.0, 0.0, 0.0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0.0, 0.0, 0.0, "1");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 0.0, 0.0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0.0, 0.0, 0.0, "2");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 100.0, 100.0, 100.0, 0.0, 0.0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0.0, 0.0, 0.0, "3");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 100.0, 100.0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.0, 0.0, 0.0, "4");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 100.0, 100.0, 100.0, 100.0, 100.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, "5");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 0.0, 100.0, 100.0, 100.0, 0.0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0.0, 0.0, 0.0, "6");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 100.0, 50.0, 100.0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, "7");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 100.0, 50.0, 100.0, 100.0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0.0, 0.0, 0.0, "8");
INSERT INTO gesture_tbl (hand, th_flex, in_flex, mi_flex, ri_flex, pi_flex, 
                         th_con, in_con, mi_con, ri_con, pi_con, ti_con, im_con, mr_con, rp_con, accel_x, accel_y, accel_z, gest)
       VALUES("right", 50.0, 50.0, 100.0, 100.0, 100.0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, "9");
