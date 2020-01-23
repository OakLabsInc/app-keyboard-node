const InputEvent = require('input-event');

const input = new InputEvent('/dev/input/event0');

const keyboard = new InputEvent.Keyboard(input);

keyboard.on('keyup'   , console.log);
keyboard.on('keydown' , console.log);
keyboard.on('keypress', console.log);