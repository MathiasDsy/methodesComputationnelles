# Fichier makefile pour ais
#--------------------------

CC=cc

TARGET=ais
FILES=ais.c anticorps.c geo.c population.c random.c gnuplot.c
OBJECTS=$(FILES:.c=.o)
CLEANING=rm -f $(OBJECTS) $(TARGET) core a.out

#-------------------------------------------------------------

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) -lm

#-------------------------------------------------------------

ais.o: params.h ais.c
	$(CC) -c -W -Wall ais.c -o ais.o

anticorps.o: params.h anticorps.c
	$(CC) -c -W -Wall anticorps.c -o anticorps.o

geo.o: params.h geo.c
	$(CC) -c -W -Wall geo.c -o geo.o

population.o: params.h population.c
	$(CC) -c -W -Wall population.c -o population.o

#-------------------------------------------------------------

.c.o :
	$(CC) -c $< -o $*.o

clean:
	$(CLEANING)
clear:
	$(CLEANING)
