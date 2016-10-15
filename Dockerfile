FROM alpine:3.4

RUN \
  sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
  apk add --update go git make gcc musl-dev         && \
  git clone -b v1.4.18 https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && make geth)                     && \
  cp go-ethereum/build/bin/geth /geth               && \
  apk del go git make gcc musl-dev                  && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*

EXPOSE 8545
EXPOSE 30303

VOLUME /root/.ethereum

COPY run.sh static-nodes.json /

ENTRYPOINT /run.sh --rpc --rpcaddr 0.0.0.0 --fast --maxpeers 100
