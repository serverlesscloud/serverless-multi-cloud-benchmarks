RUNTIME=aws-nodejs8.10
API_URL=$(AWS_NODEJS8_10_URL)

include ../common.mk

# Internals
_clean:
	rm -rf .serverless bin node_modules

_build:
	npm install --ignore-scripts