#!/bin/bash

#cmd="docker run --rm -it -v "$(pwd):/opt/work" responsive-timeline"

#$cmd sh -c "npm install; gulp;"

timelineItem=""
while read tItem; do
  # Not the best way, need to be improved
  icon=`echo "$tItem" | cut -d";" -f 1`
  title=`echo "$tItem" | cut -d";" -f 2`
  text=`echo "$tItem" | cut -d";" -f 3`
  
  # Generate HTML
  timelineItem="${timelineItem}<div class=\"timeline-item\"><div class=\"timeline-item\"><img src=\assets/images/$icon\"></div><div class=\"timeline-content\"><h2>$title</h2><p>$text</p></div></div>"
done <content.txt

# Get the other information from the user input
echo "What's your first name?:"
read firstName
echo "Hello $firstName, and what's your family name?:"
read familyName
echo "Thanks. Which title should the timeline have?:"
read title

echo "AUTHOR_FIRSTNAME=$firstName" > tmp.txt
echo "AUTHOR_LASTNAME=$familyName" >> tmp.txt
echo "TITLE=$title" >> tmp.txt
echo "CONTENT=$timelineItem" >> tmp.txt

bash-templater/templater.sh index.html.template -f tmp.txt > index.html && rm tmp.txt
