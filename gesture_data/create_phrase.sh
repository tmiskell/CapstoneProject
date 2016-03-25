ALPHADIR=../gesture_data/alphabet_xml
NUMBRDIR=../gesture_data/numbers_xml
for i in I S space D U N K I N S space S T I L L space O P E N ;
  do cp -v $ALPHADIR/gesture_data_$i.xml gesture_data_init.xml ; 
  sleep 1 ; 
done
