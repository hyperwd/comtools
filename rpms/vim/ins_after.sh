#!/usr/bash

source /etc/rc.d/init.d/functions
ln -s /usr/local/vim/bin/vim /usr/bin/vim
ln -s /usr/local/vim/bin/vimtutor /usr/bin/vimtutor
ln -s /usr/local/vim/bin/vimdiff /usr/bin/vimdiff
exit $?
