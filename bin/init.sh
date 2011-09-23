#!/bin/sh

# ~/config/ 以下で管理している dotfiles を $HOME にシンボリックリンクを貼る。
# なお、指定したリンクファイルがすでにあった場合は、上書きするかどうか問い合わせを行い、
# 上書きする場合には、.orig という suffix でファイルのバックアップを作成する。
echo "Make links for dotfiles"
#find ~/config -maxdepth 1 -name '.*' -exec ln -sbi --suffix=.orig {} ~/ \;
find ~/config -maxdepth 1 -name '.*' -exec ln -si --suffix=.orig {} ~/ \;

# get phpmanual via svn
#echo "Get phpmanual via svn"
#cd ~/config/doc/
#svn co http://svn.php.net/repository/phpdoc/modules/doc-ja ./phpmanual

# loading submodule
cd ~/config
git submodule update --init

if [ $? -eq 0 ]; then
    echo "Successfully initialized... ;)"
else
    echo "some problems occur... O_o"
fi

