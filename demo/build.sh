#!/bin/sh
emcc helloworld.c -s BINARYEN=1 -s SIDE_MODULE=1 -O3 -s "EXPORTED_FUNCTIONS=['_c_hello']"  -o helloworld.wasm
