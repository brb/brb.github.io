#!/bin/sh

awk -f music.awk music.txt > index.html
git add index.html music.txt
git commit -s -m "Update"
