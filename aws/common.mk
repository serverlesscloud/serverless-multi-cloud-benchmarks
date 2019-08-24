BUILDER=docker-compose -f ../docker-compose.yml run --rm $(RUNTIME)
SLS=docker-compose -f ../docker-compose.yml run --rm -w /opt/app/$(RUNTIME) sls
ARTILLERY=docker-compose -f ../docker-compose.yml run --rm -e API_URL=$(API_URL) artillery 

# Builder
all: clean package deploy

clean: ../.env
	$(BUILDER) make _clean

build: ../.env
	$(BUILDER) make _build

# Serverless
package: ../.env build
	$(SLS) package

deploy: ../.env
	$(SLS) deploy --package .serverless

remove: ../.env
	$(SLS) remove

# Artillery
baseLine: ../.env
	$(ARTILLERY) run --output $(RUNTIME).json reports/runtime_baseline.yml

report: ../.env
	$(ARTILLERY) report reports/$(RUNTIME).json

# Helpers
../.env:
	cp ../.env.template ../.env

shellBuilder:
	$(BUILDER) bash

shellServerless:
	$(SLS) bash

shellArtillery:
	$(ARTILLERY)