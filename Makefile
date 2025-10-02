GOOSE_VERSION = "v3.25.0"

.PHONY: build
build:
	@echo "-> Build image for goose ${GOOSE_VERSION}"

	docker \
		build \
		--build-arg GOOSE_VERSION=${GOOSE_VERSION} \
 		-t cispace/goose-mysql:local \
 		.

.PHONY: test
test: build
	docker rm goose_mysql --force || true

	docker network create goose_mysql || true

	docker run --rm --name=goose_mysql \
		--env MYSQL_ROOT_PASSWORD=root \
		--env MYSQL_DATABASE=test \
		--network goose_mysql \
		--detach \
		mysql:8.0

	sleep 30

	docker run --rm \
		-v ./tests/migrations:/migrations \
		--env GOOSE_DBSTRING='root:root@tcp(goose_mysql:3306)/test' \
		--network goose_mysql \
		cispace/goose-mysql:local \
		up

	docker rm goose_mysql --force
