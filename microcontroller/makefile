# Make file for sign language to speech conversion software
# Variables
CC=gcc
OPTMETHOD=               # Add -O for optimization
CFLAGS=-std=gnu99 -pedantic -Wall # Add -g for debugging
OUTPUT=i2c_transfer
#SRCS=i2c_transfer.c     # Uncomment to use prior version of I2C transfer program.
SRCS=i2c_transfer_opt.c
#
all: 
	$(CC) $(SRCS) $(CFLAGS) -o $(OUTPUT) $(STDLIB)
clean: 
	rm $(OUTPUT)
