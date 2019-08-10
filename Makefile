
PROVIDERS ?= aws azure google

package:
	@$(foreach PROVIDER, $(PROVIDERS),cd $(PROVIDER) && make package && cd ..;)

all:
	echo "hello"