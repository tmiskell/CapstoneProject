# Make file for sign language to speech conversion software
# Variables
CXX=g++
OPTMETHOD=               # Add -O for optimization
CONNINCLUDE=/usr/include/cppconn
FESTINCLUDE=-I /usr/include/festival/src/include/ -I /usr/include/speech_tools/include/ -I /usr/include/speech_tools/base_class/string/
LIBRARY=/usr/lib
STDLIB=-l ncurses       # Should be placed after festival libraries if festival is being used.
MYSQLLIB=-l mysqlcppconn
FESTLIBDIR=-L /usr/include/festival/src/lib/ -L /usr/include/speech_tools/lib/
FESTLIB=-l Festival -l estools -l estbase -l eststring
CPPFLAGS=-g $(OPTMETHOD) $(FESTINCLUDE) # Add -g for debugging
OUTPUT=sign2speech
SRCS=Finger.cpp Fold.cpp Hand.cpp Gesture.cpp Main.cpp ScreenText.cpp
#
all: 
	$(CXX) $(SRCS) $(CPPFLAGS) -o $(OUTPUT) $(MYSQLLIB) $(STDLIB)
clean: 
	rm $(OUTPUT)
