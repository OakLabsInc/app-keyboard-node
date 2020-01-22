'use strict';
const ioHook = require('iohook');

ioHook.on("mousemove", event => {
  console.log(event);
  // result: {type: 'mousemove',x: 700,y: 400}
});
ioHook.on("keydown", event => {
  console.log(event);
  // result: {keychar: 'f', keycode: 19, rawcode: 15, type: 'keypress'}
});
//Register and stark hook 
ioHook.start();
