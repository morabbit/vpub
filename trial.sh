#!/bin/bash

time=$(date "+%Y/%m/%Y%m%d")
file=".txt"
path="https://clashnode.com/wp-content/uploads/"

FILEURL=${path}${time}${file}
echo ${FILEURL}

>privateused

RESULT=$(curl -XGET ${FILEURL})
echo $RESULT>>privateused
