SHELL := /bin/bash
APP_ROOT ?= $(shell pwd)
VERSION ?= $(shell cat "$(APP_ROOT)/VERSION")
TRAVIS_JOB_NUMBER ?= $(VERSION)
TAG ?= $(VERSION).$(TRAVIS_JOB_NUMBER)
DOCKER_USERNAME ?= $(shell git config --get user.email | sed 's/\(.*\)@\(.*\)/\1/')
DOCKER_IMAGE ?= herokucli

.PHONY: build tag push
default: build tag

build:
	docker build \
	             --build-arg DOCKER_IMAGE="$(DOCKER_USERNAME)/$(DOCKER_IMAGE)" \
	             --build-arg TAG="$(TAG)" \
	             -t $(DOCKER_IMAGE):$(TAG) .

tag:
	docker tag $(DOCKER_IMAGE):$(TAG) $(DOCKER_USERNAME)/$(DOCKER_IMAGE):$(TAG)
	docker tag $(DOCKER_USERNAME)/$(DOCKER_IMAGE):$(TAG) $(DOCKER_USERNAME)/$(DOCKER_IMAGE):latest

push:
	echo "push $(DOCKER_USERNAME)/$(DOCKER_IMAGE):$(TAG) and latest"
	docker push $(DOCKER_USERNAME)/$(DOCKER_IMAGE):$(TAG)
	docker push $(DOCKER_USERNAME)/$(DOCKER_IMAGE):latest
