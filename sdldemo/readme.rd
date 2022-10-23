brew info sdl2

sdl helloworld:
g++ sdldemo.cpp -lSDL2 -L/opt/homebrew/Cellar/sdl2/2.0.22/lib -I/opt/homebrew/Cellar/sdl2/2.0.22/include
./a.out

sdl wasm helloworld:
https://github.com/timhutton/sdl-canvas-wasm
emcc core.cpp -s WASM=1 -s USE_SDL=2 -O3 -o index.js
http://localhost/jslinux-wasm/sdldemo/

