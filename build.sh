#!/bin/bash

docker build -t stacksparrow4/dev . || exit 1
docker push stacksparrow4/dev
