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

Creating the `websocketd` server was straight forward. I followed the instructions on github.

I chose to change the canvas colors using the `fillRect` syntax for readibility, but it is slower than actually setting each pixel's color.

### System Requirements
First, install websocketd. If you are on a Mac you can just run `./setup.sh` (assuming you have homebrew installed).

Also, make sure you have node.js installed.

### Start Websocket Server
Simply run 
```sh
./run.sh
```

This should open a new window that will refresh to the correct page momentarily.

Example http://ec2-52-55-211-196.compute-1.amazonaws.com:3213/

![example image](images/example-image.png)