FROM ethereum/client-go:alpine

VOLUME /root/.ethereum

COPY run.sh static-nodes.json /

ENTRYPOINT /run.sh --rpc --rpcaddr 0.0.0.0 --fast --maxpeers 100
