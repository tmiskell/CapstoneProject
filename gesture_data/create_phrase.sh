ALPHADIR=alphabet_xml
NUMBRDIR=numbers_xml
for i in I S space M C D O N A L D S space S T I L L space O P E N ;
  do cp -v $ALPHADIR/$i.xml gesture_data_init.xml ; 
  sleep 3 ; 
done
