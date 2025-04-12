#include <stdio.h>
#include <time.h>

void busy_wait_900_usec() {
    struct timespec start, current;
    clock_gettime(CLOCK_MONOTONIC, &start);

    while (1) {
        clock_gettime(CLOCK_MONOTONIC, &current);
        long elapsed_nsec = (current.tv_sec - start.tv_sec) * 1000000000L + (current.tv_nsec - start.tv_nsec);
        if (elapsed_nsec >= 900000) { // 900 microseconds = 900,000 nanoseconds
            break;
        }
    }
}

int main() {
    printf("Starting busy wait...\n");
    busy_wait_900_usec();
    printf("Done waiting 900 usec.\n");
    return 0;
}