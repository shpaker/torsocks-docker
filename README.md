[![Build Status](https://travis-ci.com/shpaker/torsocks-docker.svg?branch=master)](https://travis-ci.com/shpaker/torsocks-docker)

- - -

# Dockerfile with Tor proxy server

## Usage

* Build container
    ```bash
    docker build . -t torsocks
    ```

* Execute:
    ```bash
    docker run -d -p 9050:9050 torsocks
    ```

* Check proxy:
    ```bash
    curl -v -x socks5://127.0.0.1:9050 https://checkip.amazonaws.com
    ```
