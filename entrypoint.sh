#!/bin/sh
echo SOCKSPort 0.0.0.0:${PROXY_PORT} >> torrc
tor --RunAsDaemon 0 -f torrc
