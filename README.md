# goose-mysql

![Docker Image Version](https://img.shields.io/docker/v/cispace/goose-mysql?style=for-the-badge&logo=docker&label=Image%20Version&link=https%3A%2F%2Fhub.docker.com%2Fr%2Fcispace%2Fgoose-mysql)
![Docker Image Size](https://img.shields.io/docker/image-size/cispace/goose-mysql?style=for-the-badge&logo=docker&label=Image%20Size&link=https%3A%2F%2Fhub.docker.com%2Fr%2Fcispace%2Fgoose-mysql)


**goose-mysql** - is lightweight Docker image for [goose](https://github.com/pressly/goose?tab=readme-ov-file) with MySQL

Usage with Docker Compose
```yaml
services:
  migrations:
    image: cispace/goose-mysql
    volumes:
      - ./migrations:/migrations
    environment:
      GOOSE_DBSTRING: "root:root@tcp(goose_mysql:3306)/test"
    command: up
```
