ALPHADIR=$HOME/Capstone_Project/gesture_data/alphabet_xml
NUMBRDIR=$HOME/Capstone_Project/gesture_data/numbers_xml
DESTDIR=$HOME/Capstone_Project/microcomputer
for i in G E T space M E space A space C O F F E E space R I G H T space N O W ; 
  do cp -v $ALPHADIR/gesture_data_$i.xml $DESTDIR/gesture_data.xml ; 
  sleep 1 ; 
done
