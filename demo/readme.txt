#include <stdio.h>
char *c_hello() {
   return "Hello World"; 
}
#!/bin/sh
emcc helloworld.c -s BINARYEN=1 -s SIDE_MODULE=1 -O3 -s "EXPORTED_FUNCTIONS=['_c_hello']"  -o helloworld.wasm


		 const memory = new WebAssembly.Memory({ initial: 256, maximum: 256 });
	     const importObj = {
	         env: {
	             abortStackOverflow: () => { throw new Error('overflow'); },
	             table: new WebAssembly.Table({ initial: 0, maximum: 0, element: 'anyfunc' }),
	             tableBase: 0,
	             //memory: new WebAssembly.Memory({ initial: 256, maximum: 256 }),
	             "memory": memory,
	             "__memory_base": 1024,
	             STACKTOP: 0,
	             STACK_MAX: memory.buffer.byteLength,
	         }
	     };
         fetch("helloworld.wasm")
         .then(bytes => bytes.arrayBuffer())
         .then(mod => WebAssembly.compile(mod))
         //.then(module => {return new WebAssembly.Instance(module)})
         .then(module => {return new WebAssembly.Instance(module,importObj)})
         .then(instance => {
            console.log(instance);
			// 这里，把c语言中的c_hello()调用的时候，放到importObj.env.memory 的内存对象里，如果想打印，就从内存对象里取
			// 这个是从wasm 中到 js中的一个通道
            let buffer = new Uint8Array(importObj.env.memory.buffer);
            let test = instance.exports.c_hello();
            let mytext = "";
            for (let i=test; buffer[i]; i++) {
               mytext += String.fromCharCode(buffer[i]);
            }
            console.log(mytext); document.getElementById("textcontent").innerHTML = mytext;
         });


