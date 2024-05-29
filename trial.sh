#!/bin/bash

time=$(date "+%Y%m")
num="1"
file=".txt"
path_share="https://raw.staticdn.net/mianfeifq/share/main/data"
path_pawdroid="https://raw.staticdn.net/Pawdroid/Free-servers/main/sub"
pf="privateused"
REALLYFILE=${path_share}${time}${num}${file}

function clearold(){
    >$pf
}

function pawdroid(){
echo "START PAWDROID"
FILEURL=${path_pawdroid}
echo ${FILEURL}

RESULT=$(curl -L -XGET -o /dev/null -w " %{http_code}" ${FILEURL})
echo $RESULT

# 检查curl命令是否成功
if [ $RESULT -eq 200 ]; then
  echo "pawdroid内容已成功写入"
  echo $(curl -L -XGET ${FILEURL})>>$pf
else
  echo "pawdroid获取内容失败: $RESULT"
fi
echo "END PAWDROID"
}

function share(){
echo "START SHARE"
for num in {1..31}
do
    FILEURL=${path_share}${time}${num}${file}
    echo ${FILEURL}

    RESULT=$(curl -L -XGET -o /dev/null -w " %{http_code}" ${FILEURL})
    echo $RESULT

    # 检查curl命令是否成功
    if [ $RESULT -eq 200 ]; then
        clearold
        echo $(curl -L -XGET ${FILEURL})>>$pf
        REALLYFILE=${FILEURL}
        echo "share内容已成功写入"
        return 0
    else
        echo "share获取内容失败: $RESULT"
    fi

done
echo "END SHARE"
return 0
}


share
#pawdroid

>README.md
echo "update on" ${REALLYFILE} $(date "+%Y-%m-%d %H:%M:%S") >  README.md




#########################################


#echo $(curl -L -XGET ${path1})>>privateused

#wget ${FILEURL} | xargs >> privateused
#curl -L -o privateused ${FILEURL}

#fileyaml=".yaml"
#pathyaml="https://clashnode.com/wp-content/uploads/"
#FILEURLYAML=${pathyaml}${time}${fileyaml}
#echo ${FILEURLYAML}

#>privateused.yaml
#RESULTYAML=$(curl -XGET ${FILEURLYAML})
#echo $RESULTYAML>>privateused.yaml

#curl -XGET ${FILEURLYAML} -O
#dateyaml=$(date "+%Y%m%d")
#getyaml=${dateyaml}${fileyaml}
#mv ${getyaml} privateused.yaml


