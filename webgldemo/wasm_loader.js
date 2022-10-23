var Module = {};

function start_app()
{
    var canvas = document.querySelector('canvas');
    //var canvas = document.getElementById('thisc');
    canvas.width = 800;
    canvas.height = 600;   
    Module.canvas = canvas;

    //check for WebAssembly support otherwise
    //fallback to using asm.js
    if(window.WebAssembly !== undefined)
    {
        var r = new XMLHttpRequest();
        r.open('GET', 'build/app_wasm.wasm', true);
        r.responseType = 'arraybuffer';
        r.onload = function() 
        {
            Module.wasmBinary = r.response;
            var script = document.createElement('script');
            script.src = 'build/app_wasm.js';
            document.body.appendChild(script);
        };
        r.send();
    }
    else
    {
        var script = document.createElement('script');
        script.src = 'build/app_fallback.js';
        document.body.appendChild(script);
    }
}

start_app();
