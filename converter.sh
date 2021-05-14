#! /bin/bash

# 某所から拾ってきた shell script の断片
while true;do
    read -p "original path : " srcPath
    if [ "$srcPath" != "" ]; then
        break;
    fi
done

read -p "converted path : " dstPath
if [ "$dstPath" != "" ]; then
    dstPath="${dstPath}.mcfunction"
    srcDir="${srcPath%/*}\'"
    cd "${srcDir}"
    touch ${dstPath}
else
    dstPath='converted.mcfunction'
fi

echo "###########"

# 動作チェック用に追加
echo "From: $srcPath"
echo "To  : $dstPath"
echo "dir : $srcDir"
