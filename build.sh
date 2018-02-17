#!/bin/bash

cmd="docker run --rm -it -v "$(pwd):/opt/work" responsive-timeline"

$cmd sh -c "npm install; gulp;"
$cmd sh -c "echo \"Please enter your first name:\" && read firstName"
$cmd sh -c "echo \"Hello $firstName. What's your family name?:\" && read lastName"
$cmd sh -c "echo $firstName"
$cmd sh -c "echo 'Thanks. And what's the title of the timeline?:' && read title"
$cmd sh -c "echo 'Fine!'"
$cmd sh -c "while read p; do \ echo $p \ done <content.txt
#$cmd sh -c "bash-templater/templater.sh index.html.template -f content.txt > index.html"
