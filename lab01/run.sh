git pull

mpicxx -O3 -c main.c

mpicxx -o myapp main.o

mpirun -np 4 ./myapp

mpirun -np 1 -ppn 1 -maxtime 2 ./myapp
mpirun -np 2 -ppn 2 -maxtime 2 ./myapp

mps

pult t

mqtest myapp.1
mqtest myapp.2
mqtest myapp.3