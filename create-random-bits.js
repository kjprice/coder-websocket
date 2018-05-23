#!/usr/bin/env node
const NUMBER_OF_BITS = parseInt(process.argv[process.argv.length -1], 10);

if (!NUMBER_OF_BITS || isNaN(NUMBER_OF_BITS)) {
  throw new Error('Please provide an argument specifying the number of bits to create');
}

function randomBit() {
  return Math.round(Math.random());
}

output = [];
for (i = 0; i < NUMBER_OF_BITS; i++) {
  output.push(randomBit());
};

console.log(output.join(' '));