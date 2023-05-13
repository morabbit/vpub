#!/bin/bash

time=$(date "+%Y/%m/%Y%m%d")
file=".txt"
path="https://clashnode.com/wp-content/uploads/"

FILEURL=${path}${time}${file}
echo ${FILEURL}

>privateused

RESULT=$(curl -XGET ${FILEURL})
echo $RESULT>>privateused

fileyaml=".yaml"
pathyaml="https://clashnode.com/wp-content/uploads/"
FILEURLYAML=${pathyaml}${time}${fileyaml}
echo ${FILEURLYAML}

#>privateused.yaml
#RESULTYAML=$(curl -XGET ${FILEURLYAML})
#echo $RESULTYAML>>privateused.yaml

curl -XGET ${FILEURLYAML} -O
dateyaml=$(date "+%Y%m%d")
getyaml=${dateyaml}${fileyaml}
mv ${getyaml} privateused.yaml

>README.md
echo "update on" ${time} >  README.md
