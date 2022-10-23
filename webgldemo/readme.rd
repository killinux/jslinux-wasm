
https://medium.com/@meric.emmanuel/how-to-create-a-web-assembly-webgl-project-in-c-e1a0b64b0a5e

emcc main1.cpp -O3 -o build/app_wasm.js -s TOTAL_MEMORY=33554432 -s WASM=1 --std=c++11


emcc -o hello3.html hello.c -O3 -s WASM=1 -s NO_EXIT_RUNTIME=1  -s "EXTRA_EXPORTED_RUNTIME_METHODS=['ccall']"
