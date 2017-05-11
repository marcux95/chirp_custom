CC=gcc
TARGET=lut_gen_sym

all: ./src/main.c 
	$(CC) $^ -o $(TARGET) -lm

clean:
	rm -rf *.txt $(TARGET)
