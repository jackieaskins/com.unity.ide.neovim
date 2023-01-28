#!/usr/bin/env bash

# replace with your terminal
term_exec=kitty
server_path=/tmp/unitysocket

path=$1
line=$2
col=$3

if [ $line == "-1" ]; then line=0; fi
if [ $col == "-1" ]; then col=0; fi

if ! [ -e $server_path ]; then
    # start the server if its pipe doesn't exist
    $term_exec nvim --listen $server_path $path
fi

# open file in server
nvim --server $server_path --remote-send "<C-\><C-n>:n $path<CR>:call cursor($line,$col)<CR>"
open -a $term_exec
