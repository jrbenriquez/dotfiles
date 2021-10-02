#!/usr/bin/env bash
read -p "query: " query

# tmux neww bash -c "curl cht.sh/python/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1;done;"
tmux new -d -As pycht -c "curl cht.sh/python/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1;done;"
tmux send-keys -t "0" "curl cht.sh/python/`echo $query | tr ' ' '+'`" ENTER
tmux a -t pycht
# tmux neww bash -c "curl cht.sh/python/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1;done;"
