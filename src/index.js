const InputEvent = require('input-event');

const inputDevice = process.env.INPUT_DEVICE || 'event6'

const input = new InputEvent(`/dev/input/${inputDevice}`);

const keyboard = new InputEvent.Keyboard(input);

keyboard.on('keyup'   , console.log);
keyboard.on('keydown' , console.log);
keyboard.on('keypress', console.log);