#!/bin/bash

# Assumes websocketd is installed - run 
websocketd --port=3212 ./websocket.sh & /
# assumes python version 2.x
open http://localhost:3213 & /
cd public; /
python -m SimpleHTTPServer 3213 && /
fg