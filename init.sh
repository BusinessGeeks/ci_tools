#!/bin/sh

function env_check() {
    if [ $1 ]
    then
      echo "string is \$${1}"
      [[ "\$$1" ]] || { echo -e "\n\n\e[31m${1} does not exist. Please set it\e[0m"; exit 1; }
    else
      [[ "$AWS_ACCESS_KEY_ID" ]] || { echo -e "\e[31mAWS_ACCESS_KEY_ID does not exist. Please set it\e[0m"; exit 1; }
      [[ "$AWS_SECRET_ACCESS_KEY" ]] || { echo -e "\e[31mAWS_SECRET_ACCESS_KEY does not exist. Please set it\e[0m"; exit 1; }
      [[ "$AWS_DEFAULT_REGION" ]] || { echo -e "\e[31mAWS_DEFAULT_REGION does not exist. Please set it\e[0m"; exit 1; }
      [[ "$PROJECT_NAME" ]] || { echo -e "\e[31mPROJECT_NAME does not exist. Please set it\e[0m"; exit 1; }
      [[ "$DOMAIN_NAME" ]] || { echo -e "\e[31mDOMAIN_NAME does not exist. Please set it\e[0m"; exit 1; }
    fi
}

echo "env_check paramater is not empty"
env_check  hello

echo "env_check paramter is empty"
env_check