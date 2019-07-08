# Just file: https://github.com/casey/just
build:
    mkdir -p debug
    cd debug && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=YES ..
    cd debug && cmake --build . -- -j8
    rm -f compile_commands.json
    ln -s debug/compile_commands.json

release:
    mkdir -p release
    cd release && cmake -DCMAKE_BUILD_TYPE=Release ..
    cd release && cmake --build . -- -j8

clean:
	rm -rf debug
	rm -rf release

clean-build: clean build
