#!/bin/sh

if [ -f 'pwd.txt' ]
then
  echo
else
  echo 'dummy user' > pwd.txt
  /geth --password pwd.txt account new
fi

grep -v '#' /static-nodes.json > /root/.ethereum/static-nodes.json

exec /geth $@
