#ifndef UNOVA_UTIL_STATISTICS_H_
#define UNOVA_UTIL_STATISTICS_H_

#include <stdint.h>
#include <sys/time.h>
#include <time.h>

#define MEASURE_TIMING 1

#define sfence() __asm__ __volatile__("sfence" : : : "memory")
#define barrier() asm volatile("": : :"memory")

extern uint64_t file_write_time;
extern uint64_t pm_io_time;
extern uint64_t log_io_time;

static inline uint64_t GetTsNsec() {
    struct timespec tp;
    clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
    return tp.tv_sec * 1000000000ULL + tp.tv_nsec;
}

#ifdef MEASURE_TIMING
#define STATISTICS_START_TIMING(name, start) \
	do { start = GetTsNsec(); } while(0)

#define STATISTICS_END_TIMING(name, start) \
	do { \
        sfence(); \
        uint64_t end = GetTsNsec(); \
		__atomic_add_fetch(&name, end - start, __ATOMIC_SEQ_CST); \
    } while(0)

#else

#define NOVA_START_TIMING(name, start) void(0)
#define NOVA_END_TIMING(name, start) void(0)

#endif

void statistics_clear();
void statistics_print();

#endif
