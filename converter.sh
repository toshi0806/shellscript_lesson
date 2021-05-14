#! /bin/bash

# 某所から拾ってきた shell script の断片

suffix='.mcfunction'
defaultDstPath="converted${suffix}"

if [ $# == 2 ]; then
# 引数が2つなら、変換前ファイル名は第1引数、変換後ファイル名は第2引数
    srcPath=$1
    dstPath=$2
elif [ $# == 1 ]; then
# 引数が1つなら、変換前ファイル名は第1引数、変換後ファイル名はデフォルト
# 変換後ファイル名の実際の代入は、 echo "###" の直前ぐらい
    srcPath=$1
    dstPath=''
else
# 引数が0なら、対話的にファイル名を取得
    while true;do
        read -p "original path : " srcPath
        if [ "$srcPath" != "" ]; then
            break;
        fi
    done
    
    read -p "converted path : " dstPath
fi

if [ "$dstPath" != "" ]; then
    dstPath="${dstPath}${suffix}"
# suffix が重複していた場合削除
    dstPath="${dstPath//${suffix}${suffix}/${suffix}}"
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
