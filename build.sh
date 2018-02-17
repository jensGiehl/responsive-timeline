#!/bin/bash

cmd="docker run --rm -it -v "$(pwd):/opt/work" responsive-timeline"

$cmd sh -c "npm install; gulp;"
