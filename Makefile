RELEASE_TYPE ?= minor
IMAGE = simple-kv-server
TAG = $(shell git describe --abbrev=0 --tags)

init:
	# do nothing as for now

start:
	@cargo run --bin kvs

start-client:
	@cargo run --bin kvc

gen-cert:
	@cargo run --bin gen_cert

gen-config:
	@cargo run --bin gen_config

build-proto:
	@BUILD_PROTO=1 cargo build

build-release-local:
	@cargo build --release
	@cp ~/.target/release/kvs ./bin

build-release:
	@cargo build --release
	@cp ./target/release/kvs ./bin

bump-release:
	@cargo release $(RELEASE_TYPE) --no-dev-version --skip-publish --skip-tag

show-tag:
	@git tag -l --format='%(contents)' $(TAG)

build-docker:
	@docker build -t perlou/${IMAGE}:${TAG} .
	@docker tag perlou/${IMAGE}:${TAG} perlou/${IMAGE}:latest

push-docker:
	@docker push perlou/${IMAGE}:${TAG}
	@docker push perlou/${IMAGE}:latest
