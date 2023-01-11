tests: clean_test build_tests
unittest: clean_test run_unittest
benchmark: clean_test run_benchmark

build_tests:
	cmake \
	-S. \
	-Bbuild \
	-DCMAKE_BUILD_TYPE=Release \
	-DBENCHMARK_ENABLE_TESTING=OFF \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
	-DSTARTER_CPP_BUILD_TESTS=ON
	cmake --build build -j

run_unittest:
	./build/bin/unit_test

run_benchmark:
	./build/bin/unit_benchmark

clean:
	rm -rf ./build

clean_test:
	if [ -d ./build/test ]; then \
		find ./build/test -name "*.gcda" -print0 | xargs -0 rm -f; \
	fi

bazel_ut:
	bazel run :unittest --compilation_mode=opt

bazel_bench:
	bazel run :benchmark --compilation_mode=opt

bazel_coverage:
	bazel coverage --test_output=all :unittest

bazel_coverage_genhtml:
	genhtml --output bazel-coverage-html ./bazel-testlogs/unittest/coverage.dat

bazel_clean:
	rm -rf bazel-* external

bazel_refresh_all:
	bazel run @bazel_compile_commands_extractor//:refresh_all

.PHONY: clean clean_test bazel_clean
