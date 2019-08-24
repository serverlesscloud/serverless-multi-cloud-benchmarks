BUILDER=docker-compose -f ../docker-compose.yml run --rm $(RUNTIME)
SLS=docker-compose -f ../docker-compose.yml run --rm -w /opt/app/$(RUNTIME) sls

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

baseLine:
	echo $(API_URL)
	API_URL=$(API_URL) artillery run --output $(RUNTIME).json ../../artillery/runtime_baseline.yml

baseLineReport:
	artillery report $(RUNTIME).json

# Helpers
../.env:
	cp ../.env.template ../.env

shellBuilder:
	$(BUILDER) bash

shellServerless:
	$(SLS) bash