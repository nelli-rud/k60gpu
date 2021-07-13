#include <mpi.h>
#include <iostream>
#include <unistd.h>
#include <thread>
#include <vector>
#include <chrono>
#include <ctime>

#include "cpuThreads.h"

extern "C"
void thread_proc(int tnum, int rank) {
fprintf(stderr, "Thread %d started at node %d... \n", tnum, rank);

auto start = std::chrono::system_clock::now();
int pauseTime = tnum * 100;
std::this_thread::sleep_for(std::chrono::milliseconds(pauseTime));
auto end = std::chrono::system_clock::now();

std::chrono::duration<double> elapsed_seconds = end-start;

fprintf(stderr, "Time: %lf. MPI rank: %d. Process ID: %d. Thread index: %d. pauseTime = %d. elapsed_seconds: %lf \n",
                 MPI_Wtime(), rank, getpid(), tnum, pauseTime, elapsed_seconds);
}

extern "C"
void testThreads(int rank){
    std::vector<std::thread> threads;
    for(int i = 0; i < std::thread::hardware_concurrency()-1; i++)
        std::thread thr(thread_proc, i, rank);
        threads.emplace_back(std::move(thr));
    }
    
    for(auto& thr : threads) {
        thr.join()
    }
}
