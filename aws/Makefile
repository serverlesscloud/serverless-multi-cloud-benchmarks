RUNTIMES ?= $(shell ls -d */)

.env:
	cp .env.template .env

all: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME) && make && cd ..;)

package: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME) && make package && cd ..;)

deploy: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make deploy && cd ..;)

baseLine: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make baseLine && cd ..;)

report: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make report && cd ..;)

clean: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make clean && cd ..;)

remove: .env
	@$(foreach RUNTIME, $(RUNTIMES),cd $(RUNTIME); make remove && cd ..;)

reset: .env
	@$(foreach RUNTIME, $(RUNTIMES), $(call resetDynamo, $(RUNTIME)) )

define resetDynamo
	echo "deleting items in $(RUNTIME)"
	aws dynamodb scan \
		--region $(AWS_REGION) --table-name $(subst /,,$(1)) --attributes-to-get "id" --query "Items[].id.S" --output text | tr "\t" "\n" | \
		xargs -t -I keyvalue aws dynamodb delete-item --table-name $TABLE_NAME --key '{"id": {"S": "keyvalue"}}'
endef

