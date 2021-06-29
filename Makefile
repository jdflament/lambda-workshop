DOCKER_COMPOSE	= docker-compose
SERVERLESS		= $(DOCKER_COMPOSE) run --rm serverless
PHP				= $(DOCKER_COMPOSE) run --rm php
SYMFONY			= $(PHP) bin/console

php:
	$(PHP) sh

deploy: cc-prod
	$(SERVERLESS) deploy --aws-profile=bref

cc:
	$(SYMFONY) cache:clear

cc-prod:
	$(SYMFONY) cache:clear --env=prod
