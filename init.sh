#!/bin/sh

# Check for required variables
function env_check() {
      [[ "$AWS_ACCESS_KEY_ID" ]] || { echo -e "\e[31mAWS_ACCESS_KEY_ID does not exist. Please set it.\e[0m"; exit 1; }
      [[ "$AWS_SECRET_ACCESS_KEY" ]] || { echo -e "\e[31mAWS_SECRET_ACCESS_KEY does not exist. Please set it.\e[0m"; exit 1; }
      [[ "$PROJECT_NAME" ]] || { echo -e "\e[31mPROJECT_NAME does not exist. Please set it.\e[0m"; exit 1; }
      [[ "$DOMAIN_NAME" ]] || { echo -e "\e[31mDOMAIN_NAME does not exist. Please set it.\e[0m"; exit 1; }
}

# Check and setup Docker properly
function setup_docker() {
  if ! docker info &>/dev/null; then
    if [ -z "$DOCKER_HOST" -a "$KUBERNETES_PORT" ]; then
      export DOCKER_HOST='tcp://localhost:2375'
    fi
  fi
}

echo $1
