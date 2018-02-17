#!/bin/bash

cmd="docker run --rm -it -v "$(pwd):/opt/work" responsive-timeline"

$cmd sh -c "npm install; gulp;"
$cmd sh -c "bash-templater/templater.sh index.html.template -f content.txt > index.html"
