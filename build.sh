#!/bin/sh 

docker  build --progress=plain --build-arg CACHEBUST=42 -t ricp/gambas:3.17.3 .