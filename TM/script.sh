#!/bin/bash

cd /home/hackerman/TM/console/bin/

echo 'Introduzca peers: '

read numeroPeers

./splitter --source_addr 150.214.150.68 --source_port 4551 --splitter_port 8001 --channel BBB-134.ogv --header_size 30000 > /home/hackerman/TM/console/ejecuciones/ejecucionSplitter.txt &

./monitor --splitter_addr 127.0.0.1 --splitter_port 8001 > /home/hackerman/TM/console/ejecuciones/ejecucionMonitor.txt &

vlc http://localhost:9999 &

for ((i=0; i<$numeroPeers; i++))
do
./peer --splitter_addr 127.0.0.1 --splitter_port 8001 --player_port 10000 &
done

vlc http://localhost:10000 &



