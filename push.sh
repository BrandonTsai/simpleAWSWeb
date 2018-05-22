#!/bin/bash

push() {
  read -p "Version: " version
  version=${version:-latest}

  docker tag simple-web:latest 149778305054.dkr.ecr.ap-southeast-2.amazonaws.com/ecs-sandbox:$version
  docker push 149778305054.dkr.ecr.ap-southeast-2.amazonaws.com/ecs-sandbox:$version
}

push