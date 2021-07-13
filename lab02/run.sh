git pull

mpicxx -O3 -std=c++11 -c main.cpp
mpicxx -O3 -std=c++11 -c utils.cpp
mpicxx -O3 -std=c++11 -c cpuThreads.cpp

mpicxx -o myapp2 main.o utils.o cpuThreads.o

mpirun -np 1  -ppn 1 -maxtime 2 ./myapp2

mps

pult t

mqtest myapp2.1