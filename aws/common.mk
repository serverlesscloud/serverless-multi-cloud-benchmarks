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
	$(SLS) deploy

remove: ../.env
	$(SLS) remove

# Helpers
../.env:
	cp ../.env.template ../.env