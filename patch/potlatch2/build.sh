#!/bin/bash
set -e
BASE=`dirname $0`

SRC=$BASE/assets
TARGET=`readlink -f $BASE/../../vendor/assets/potlatch2/potlatch2/assets.zip`

if [ -f "$TARGET" ]; then
    rm $TARGET
fi
pushd $SRC
zip -r $TARGET ./
popd