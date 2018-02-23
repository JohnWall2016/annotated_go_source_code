#!/usr/bin/env bash
# Copyright 2009 The Go Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -e
if [ ! -f make.bash ]; then
	echo 'all.bash must be run from $GOROOT/src' 1>&2
	exit 1
fi
OLDPATH="$PATH"
# 从源代码编译go环境
. ./make.bash "$@" --no-banner
# 测试刚编译的go环境
bash run.bash --no-rebuild
PATH="$OLDPATH"
# 打印安装信息栏
$GOTOOLDIR/dist banner  # print build info
