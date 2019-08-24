
.env:
	cp .env.template .env

RUNTIMES ?= $(shell ls -d */)

double:
	@echo $(API_URL)

baseline:
	API_URL=$(AWS_NODEJS_8_URL) artillery run --output aws_node8.json runtime_baseline.yml
	API_URL=$(GCP_NODEJS_8_URL) artillery run --output gcp_node8.json runtime_baseline.yml

baselineReport:
	artillery report aws_node8.json
	artillery report gcp_node8.json