
PROVIDERS ?= aws azure google

package:
	@$(foreach PROVIDER, $(PROVIDERS),cd $(PROVIDER) && make package && cd ..;)

deploy:
	@$(foreach PROVIDER, $(PROVIDERS),cd $(PROVIDER) && make deploy && cd ..;)
