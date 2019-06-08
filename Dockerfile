FROM alpine:3.9

# install tor
RUN apk --update add tor

# env vars
ARG PROXY_PORT=9050
ARG HEALTHCHECK_URL=https://checkip.amazonaws.com

# add files anf user
RUN     adduser -D -h /home/torproxy torproxy
WORKDIR /home/torproxy/

EXPOSE ${PROXY_PORT}

HEALTHCHECK --start-period=1m \
    CMD curl --fail --proxy socks5://127.0.0.1:${PROXY_PORT} '${HEALTHCHECK_URL}' || exit 1

# execute from user
USER torproxy
RUN  echo SOCKSPort 0.0.0.0:${PROXY_PORT} > torrc
ENTRYPOINT ["tor", "--RunAsDaemon", "0", "-f", "torrc"]
