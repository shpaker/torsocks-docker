FROM alpine:3.9

# install tor
RUN apk --update add tor

# env vars
ARG PROXY_PORT=9050

# add files anf user
RUN     adduser -D -h /home/torproxy torproxy
WORKDIR /home/torproxy/

# execute from user
USER torproxy
RUN  echo SOCKSPort 0.0.0.0:${PROXY_PORT} > torrc

EXPOSE ${PROXY_PORT}

ENTRYPOINT ["tor", "--RunAsDaemon", "0", "-f", "torrc"]
