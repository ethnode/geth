#!/bin/sh

if [ "$1" = "" ]
then
  data_folder="/root/.ethereum"
else
  data_folder="$1"
fi

if [ -f 'pwd.txt' ]
then
  echo
else
  echo 'dummy user' > pwd.txt
  /geth --datadir $data_folder --password pwd.txt account new
fi

grep -v '#' /static-nodes.json > $data_folder/static-nodes.json

