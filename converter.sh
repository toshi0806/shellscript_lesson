#! /bin/bash

# 某所から拾ってきた shell script の断片
while(true);do
    read -p "original path : " filePass
    if [ "$filePass" != "" ]; then
        break;
    fi
done

read -p "converted path : " convertname
if [ "$convertname" != "" ]; then
    convertname=`echo ${convertname}.mcfunction`
    filedir=`dirname ${filePass}`
    filedir=`echo ${filedir}\'`
    cd "${filedir}"
    touch ${convertname};
else
    convertname='converted.mcfunction'
fi

echo "###########"

# 動作チェック用に追加
echo "From: $filePass"
echo "To  : $convertname"
echo "dir : $filedir"
