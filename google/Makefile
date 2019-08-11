RUNTIMES ?= $(shell ls -d */)

.env:
	cp .env.template .env

all: clean build deploy
.PHONY: clean build deploy

clean: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME), make _clean;)

package: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make package);)

deploy: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make deploy);)

remove: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make _remove);)
