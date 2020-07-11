#!/bin/bash

OPTIONS=p:ibdr
LONGOPTS=project,install,build,deploy,remove

! PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTS --name "$0" -- "$@")

p=0 i=0 p=0 b=0 d=0

CF_FILE="/tmp/cf_file.txt"
DEPLOYMENTS_BUCKET="maudeployments"

if [[ $1 == "-p" ]] || [[ $1 == "--project" ]]; then
  project=$2
  cd $project
else
  exit 126 # Command invoked cannot execute
fi

case "$3" in
  -i|--install)
    i=1
    shift
    ;;
  -r|--remove)
    r=1
    shift
    ;;
  -b|--build)
    b=1
    shift
    ;;
  -d|--deploy)
    d=1
    shift
    ;;
  --)
    shift
    break
    ;;
  *)
    ;;
esac

if [[ $i -eq 1 ]]; then
  echo "install"
fi

if [[ $b -eq 1 ]]; then
  echo "build"
fi

if [[ $d -eq 1 ]]; then
  aws cloudformation deploy \
    --no-fail-on-empty-changeset \
    --template-file template.yaml \
    --stack-name $project \
    --capabilities CAPABILITY_NAMED_IAM
fi
