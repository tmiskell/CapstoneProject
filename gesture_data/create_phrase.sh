ALPHADIR=$HOME/CapstoneProject/gesture_data/alphabet_xml
NUMBRDIR=$HOME/CapstoneProject/gesture_data/numbers_xml
DESTDIR=$HOME/CapstoneProject/gesture_data
for i in D O space Y O U space W A N T space M E space T O space S T A Y ; 
  do cp -v $ALPHADIR/gesture_data_$i.xml $DESTDIR/gesture_data_init.xml ; 
  sleep 1 ; 
done
