## Create an image with randomly filled pixels created by a websocketd bash program

Instructions

> Create a bash session using “websocketd” (https://github.com/joewalnes/websocketd). Execute a command to output 10kb of random data from the WebSocket. Use that data to draw a 800x100 canvas with each pixel representing a single bit. For every bit with a value of 1, draw the pixel black, otherwise draw it white.

### Process To Complete
I first created the random generator directly within [websocket.sh](websocket.sh), but found this was extremely slow using several methods:
 - takes ~2.13 seconds to output 80K bits one at a time
 - takes ~133.60 seconds to concatenate a string and output all 80K bits at once YEESH
 - takes ~1.5 seconds to create an array of random variables and then output the join (but then crashes everything)

So, then I decided to have node create the random bits but still have the bits served using `websocket.sh`. This is rather unnecessary. This node program [create-random-bits.js](create-random-bits.js) takes just 0.12 seconds to run.

```sh
time ./create-random-bits.js 80000 > /dev/null
```

### Setup
First, install websocketd. If you are on a Mac, like myself, you can just run `./setup.sh`.

### Start Websocket Server
```sh
./websocket.sh
```
