#!/bin/bash

# Adds emsdk tools to PATH
#source /path_to_emscripten/emsdk/emsdk_env.sh
source /Users/bytedance/Desktop/code/emscripten/emsdk/emsdk_env.sh


INPUT=hello.cpp
#INPUT=hello1.cpp
#INPUT=hello2.cpp
OPTIMISATIONS=-O0
#MEMORY=32*1024*1024
MEMORY=33554432

#if emcc $INPUT $OPTIMISATIONS -o build/app_wasm.js -s TOTAL_MEMORY=$MEMORY -s WASM=1 --std=c++11 -lGL -s MAX_WEBGL_VERSION=2 -s GL_ASSERTIONS
if emcc $INPUT $OPTIMISATIONS -o build/app_wasm.js -s TOTAL_MEMORY=$MEMORY -s WASM=1  -lGL -s MAX_WEBGL_VERSION=2 -s GL_ASSERTIONS
then
	echo "AWWW YEAH!";

#If WASM compiled ok generate fallback ASM code
emcc $INPUT  \
     $OPTIMISATIONS \
     -o build/app_fallback.js \
     -s TOTAL_MEMORY=$MEMORY \
     -s WASM=0 \
	 -lGL -s MAX_WEBGL_VERSION=2 -s GL_ASSERTIONS \
     --std=c++11

#reload browser tab or whatever

else
	echo "HALP!";
fi
