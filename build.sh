#!/bin/sh 

docker  build --progress=plain --build-arg CACHEBUST=true  -t gambas:3.17.3 .