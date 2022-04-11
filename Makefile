
all:
	cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DBENCHMARK_ENABLE_TESTING=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1
	cmake --build build -j

debug:
	cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1
	cmake --build build -j

unittest:
	./build/bin/unit_test

benchmark:
	./build/bin/unit_benchmark

.PHONY: clean
clean:
	rm -rf ./build
