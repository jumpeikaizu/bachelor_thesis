#!/bin/sh
for file in *.png
do
    convert $file eps2:${file%.png}.eps
done
