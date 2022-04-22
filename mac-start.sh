#!/bin/bash

docker pull ssmay0/chiron-rust-client
mkdir -p /tmp/rust-content
docker run -d -p 8080:8080 -v /tmp/rust-content:/host ssmay0/chiron-rust-client
code /tmp/rust-content
open http://localhost:8080