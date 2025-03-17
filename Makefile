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