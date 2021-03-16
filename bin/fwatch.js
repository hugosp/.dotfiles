'use strict'

const fs = require('fs');
const spawn = require('child_process').spawn;
const filename = process.argv[2];

if(!filename) {
   throw Error('A file must specified');
}

fs.watch(filename ,() => {

const ls = spawn('ls', ['-l', '-h', filename]);

let outpt = '';

// Added event listener like 'data', 'close'

ls.stdout.on('data', chunk => outpt += chunk);

ls.on('close', () => {
	const parts = outpt.split(/|s+/);
	console.log(parts[0],parts[4],parts[8]);
});

ls.stdout.pipe(process.stdout);
});
console.log(`Now Watching Your Awesome ${filename} for change `);
