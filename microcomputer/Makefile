# Make file for sign language to speech conversion software
# Variables
CXX=g++
OPTMETHOD=-std=c++11 -pedantic -Wall # Add -O for optimization
FESTINCLUDE=-I /usr/include/festival/src/include/ -I /usr/include/speech_tools/include/ -I /usr/include/speech_tools/base_class/string/
LIBRARY=/usr/lib
MYSQLLIB=-l mysqlcppconn
STDLIB=-l ncurses       # Should be placed after festival libraries if festival is being used.
FESTLIBDIR=-L /usr/include/festival/src/lib/ -L /usr/include/speech_tools/lib/
FESTLIB=-l Festival -l estools -l estbase -l eststring
CPPFLAGS=$(OPTMETHOD) $(FESTINCLUDE) `pkg-config gtkmm-3.0 --cflags --libs` # Add -g for debugging
OUTPUT=sign2speech
SRCS=Finger.cpp Fold.cpp Hand.cpp Gesture.cpp Lsm303.cpp Lsm9dof.cpp main.cpp ScreenText.cpp parser.cpp worker.cpp window.cpp variables.cpp
#
all: 
	$(CXX) $(SRCS) $(CPPFLAGS) -o $(OUTPUT) $(MYSQLLIB) $(STDLIB)
clean: 
	rm $(OUTPUT)
