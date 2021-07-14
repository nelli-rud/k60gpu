git pull

mpicxx -O3 -std=c++11 -c main.cpp
mpicxx -O3 -std=c++11 -c utils.cpp
mpicxx -O3 -std=c++11 -c cpuThreads.cpp

nvcc -arch sm_70 --ptxas-options=-v -c gpu.cu

mpicxx -L/usr/local/cuda/lib64 -lcudart -lm -o myapp3 main.o utils.o cpuThreads.o gpu.o

mpirun -np 1  -ppn 1 -maxtime 2 ./myapp3

mps

pult t

mqtest myapp3.1