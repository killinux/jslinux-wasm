#!/bin/sh
g++ sdldemo.cpp -lSDL2 -L/opt/homebrew/Cellar/sdl2/2.0.22/lib -I/opt/homebrew/Cellar/sdl2/2.0.22/include

emcc core.cpp -s WASM=1 -s USE_SDL=2 -O3 -o index.js
