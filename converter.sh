#! /bin/bash

# 某所から拾ってきた shell script の断片

suffix='.mcfunction'
defaultDstPath="converted${suffix}"

while true;do
    read -p "original path : " srcPath
    if [ "$srcPath" != "" ]; then
        break;
    fi
done

read -p "converted path : " dstPath
if [ "$dstPath" != "" ]; then
    dstPath="${dstPath}${suffix}"
    srcDir="${srcPath%/*}\'"
    cd "${srcDir}"
    touch "${dstPath}"
else
    dstPath="${defaultDstPath}"
fi

echo "###########"

# 動作チェック用に追加
echo "From: $srcPath"
echo "To  : $dstPath"
echo "dir : $srcDir"
