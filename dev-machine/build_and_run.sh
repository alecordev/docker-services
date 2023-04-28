#!/bin/bash

docker build -t dev-image .
docker run -d -p 2222:22 -v /home/user/PycharmProjects/Moodys/github/dev-containers/dev-machine/root:/root --name dev-container dev-image
ssh root@localhost -p 2222