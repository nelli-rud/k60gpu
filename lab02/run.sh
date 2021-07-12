git pull

mpicxx -O3 -std=c++11 -c main.cpp
mpicxx -O3 -std=c++11 -c utils.cpp

mpicxx -o myapp2 main.o utils.o

mpirun -np 4 ./myapp2

mps

pult t

mqtest myapp2.1