BUILDER=docker-compose -f ../docker-compose.yml run --rm $(RUNTIME)
SLS=docker-compose -f ../docker-compose.yml run --rm -w /opt/app/gcp/$(RUNTIME) sls
ARTILLERY=docker-compose -f ../docker-compose.yml run --rm -e API_URL=$(API_URL) artillery 
ARTILLERY_BASH=docker-compose -f ../docker-compose.yml run --rm -e API_URL=$(API_URL) --entrypoint bash artillery 

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
	if test -d .serverless; then $(SLS) deploy --package .serverless; \
	else $(SLS) deploy; \
	fi
	
remove: ../.env
	$(SLS) remove

# Artillery
baseLine: ../.env
	$(ARTILLERY) run --output reports/$(RUNTIME).json runtime_baseline.yml

report: ../.env
	$(ARTILLERY) report reports/$(RUNTIME).json

# Helpers
../.env:
	cp ../.env.template ../.env

shellBuilder: ../.env
	$(BUILDER) bash

shellSls: ../.env
	$(SLS) bash

shellArtillery: ../.env
	$(ARTILLERY_BASH)