include(FetchContent)

FetchContent_Declare(
    gtest
    QUIET
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.11.0
)

FetchContent_Declare(
    gbenchmark
    QUIET
    GIT_REPOSITORY https://github.com/google/benchmark.git
    GIT_TAG v1.6.0
)

FetchContent_Declare(
    snapshot
    QUIET
    GIT_REPOSITORY https://github.com/Dup4/snapshot-cpp.git
    GIT_TAG v0.1.8
)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
set(BUILD_GMOCK ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(gtest gbenchmark snapshot)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")

file(GLOB UNITTEST_FILE "*_test.cc")
add_executable(
    unit_test
    ${UNITTEST_FILE}
)

target_link_libraries(
    unit_test
PRIVATE
    snapshot
    gtest
    gtest_main
)

# automatic discovery of unit tests
include(GoogleTest)
gtest_discover_tests(
    unit_test
PROPERTIES
    LABELS "unit"
DISCOVERY_TIMEOUT  # how long to wait (in seconds) before crashing
    240
)

file(GLOB BENCHMARK_FILE "*_benchmark.cc")
add_executable(
    unit_benchmark
    ${BENCHMARK_FILE}
)

target_link_libraries(
    unit_benchmark
PRIVATE
    snapshot
    benchmark::benchmark
    benchmark::benchmark_main
)
