var keyboard = new require('./app.js');

keyboard.on('key.down:a', function() {
	console.log('A key pressed');
});

keyboard.on('key.up:a', function() {
	console.log('A key released');
});

keyboard.on('key.up:ctrl+b', function() {
	console.log('Ctrl+B pressed');
});
keyboard.listen();