#!/usr/bin/env bash

docker run -it --rm \
    -p 35729:35729 \
    -p 4000:4000 \
    --name=scaffold \
    -v ~/.ivy2:/root/.ivy2  -v ~/.sbt:/root/.sbt \
    -w /nanodegree \
    -v $(pwd)/nanodegree:/nanodegree \
    nanodegree-scaffolding ./publish.sh -l