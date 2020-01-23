const InputEvent = require('input-event');

const inputDevice = process.env.INPUT_DEVICE || '/dev/input/event6'

const input = new InputEvent(inputDevice);

const keyboard = new InputEvent.Keyboard(input);

keyboard.on('keyup'   , console.log);
keyboard.on('keydown' , console.log);
keyboard.on('keypress', console.log);