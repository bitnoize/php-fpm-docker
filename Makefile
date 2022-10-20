
IMAGENAME := ghcr.io/bitnoize/php-fpm

.PHONY: help build rebuild push pull

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild push pull"

#build: export BUILD_OPTS := ...
build: .build-7.4-bullseye .build-7.3-bullseye .build-7.2-bullseye

rebuild: export BUILD_OPTS := --pull --no-cache
rebuild: .build-7.4-bullseye .build-7.3-bullseye .build-7.2-bullseye

.build-7.4-bullseye:
	docker build $(BUILD_OPTS) \
		--build-arg PHP_VERSION=7.4 \
		-t "$(IMAGENAME):7.4-bullseye" \
		-t "$(IMAGENAME):7-bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

.build-7.3-bullseye:
	docker build $(BUILD_OPTS) \
		--build-arg PHP_VERSION=7.3 \
		-t "$(IMAGENAME):7.3-bullseye" \
		-f Dockerfile.bullseye \
		.

.build-7.2-bullseye:
	docker build $(BUILD_OPTS) \
		--build-arg PHP_VERSION=7.2 \
		-t "$(IMAGENAME):7.2-bullseye" \
		-f Dockerfile.bullseye \
		.

#push: export PUSH_OPTS := ...
push: .push-7.4-bullseye .push-7.3-bullseye .push-7.2-bullseye

.push-7.4-bullseye:
	docker push $(PUSH_OPTS) "$(IMAGENAME):7.4-bullseye"
	docker push $(PUSH_OPTS) "$(IMAGENAME):7-bullseye"
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"

.push-7.3-bullseye:
	docker push $(PUSH_OPTS) "$(IMAGENAME):7.3-bullseye"

.push-7.2-bullseye:
	docker push $(PUSH_OPTS) "$(IMAGENAME):7.2-bullseye"

#pull: export PULL_OPTS := ...
pull: .pull-7.4-bullseye .pull-7.3-bullseye .pull-7.2-bullseye

.pull-7.4-bullseye:
	docker pull $(PULL_OPTS) "$(IMAGENAME):7.4-bullseye"
	docker pull $(PULL_OPTS) "$(IMAGENAME):7-bullseye"
	docker pull $(PULL_OPTS) "$(IMAGENAME):latest"

.pull-7.3-bullseye:
	docker pull $(PULL_OPTS) "$(IMAGENAME):7.3-bullseye"

.pull-7.2-bullseye:
	docker pull $(PULL_OPTS) "$(IMAGENAME):7.2-bullseye"

