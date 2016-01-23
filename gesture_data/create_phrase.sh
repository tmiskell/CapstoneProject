ALPHADIR=$HOME/CapstoneProject/gesture_data/alphabet_xml
NUMBRDIR=$HOME/CapstoneProject/gesture_data/numbers_xml
DESTDIR=$HOME/CapstoneProject/gesture_data
for i in I S space D U N K I N S space S T I L L space O P E N ;
  do cp -v $ALPHADIR/gesture_data_$i.xml $DESTDIR/gesture_data_init.xml ; 
  sleep 1 ; 
done
