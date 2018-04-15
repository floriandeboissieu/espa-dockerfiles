.DEFAULT_GOAL := build
REPO       := $(or $(DOCKER_USER),$(shell whoami))"/$(shell basename $(shell pwd))"
BRANCH     := $(or $(TRAVIS_BRANCH),$(shell git rev-parse --abbrev-ref HEAD | tr / -))
COMMIT     := $(or $(TRAVIS_COMMIT),$(shell git rev-parse HEAD))
COMMIT_TAG := $(REPO):$(COMMIT)
BRANCH_TAG := $(REPO):$(IMAGE_TAG)

build:
	@docker build --target builder -f Dockerfile -t $(COMMIT_TAG) --rm=true --compress $(PWD)

tag:
	@docker tag $(COMMIT_TAG) $(BRANCH_TAG)

login:
	@$(if $(and $(DOCKER_USER), $(DOCKER_PASS)), docker login -u $(DOCKER_USER) -p $(DOCKER_PASS), docker login)

push: login
	docker push $(REPO)

debug:
	@echo "VERSION:    $(VERSION)"
	@echo "REPO:       $(REPO)"
	@echo "BRANCH:     $(BRANCH)"
	@echo "COMMIT_TAG: $(COMMIT_TAG)"
	@echo "BRANCH_TAG: $(BRANCH_TAG)"

docker-deploy: debug build tag push
