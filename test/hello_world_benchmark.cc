#include "benchmark/benchmark.h"

static void BenchmarkHelloWorld(benchmark::State& state) {
    for (auto _ : state) {
    }
}

BENCHMARK(BenchmarkHelloWorld);
