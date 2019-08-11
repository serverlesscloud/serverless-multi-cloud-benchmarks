BUILDER=docker-compose -f ../docker-compose.yml run --rm $(RUNTIME)
SLS=docker-compose -f ../docker-compose.yml run --rm -w /opt/app/$(RUNTIME) sls

# Builder
clean: .env
	$(BUILDER) make _clean

build:
	$(BUILDER) make _build

# Serverless 
package: .env build
	$(SLS) package

deploy: .env
	$(SLS) _deploy

remove: .env
	$(SLS) _remove

# Helpers
.env:
	cp ../.env.template .env