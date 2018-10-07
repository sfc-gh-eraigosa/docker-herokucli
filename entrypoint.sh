#!/bin/bash

function init() {
  echo "alias heroku='docker run -it --rm --volume \"\$(pwd)\":/workspace --volume \"\${HOME}/.local\":$HOME/.local --volume \"\${HOME}/.cache\":$HOME/.cache --volume \"\${HOME}/.netrc\":$HOME/.netrc ${DOCKER_IMAGE}:${TAG}'"
}

function test() {
  echo "Checking whats installed"                    \
    && echo "git version    ==> $(git --version)"    \
    && echo "heroku version ==> $(heroku --version)" \
    && echo "Woot! Everything checks out, build on!"
}

function shell() {
  bash --login
}

if [ "$1" = "init" ]; then
  init
elif [ "$1" = "test" ]; then
  test
elif [ "$1" = "shell" ]; then
  shell
else
  heroku $@
fi
