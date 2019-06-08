FROM alpine:3.9

# install tor
RUN apk --update add tor

# env vars
ENV PROXY_PORT=9050

# add files anf user
RUN     adduser -D -h /home/torproxy torproxy
WORKDIR /home/torproxy/
COPY    entrypoint.sh .
RUN     chmod +x entrypoint.sh

# execute from user
USER torproxy
ENTRYPOINT ["./entrypoint.sh"]
