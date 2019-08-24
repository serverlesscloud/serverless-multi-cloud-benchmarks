RUNTIME=aws-ruby2.5
API_URL=$(AWS_RUBY2_5_URL)

include ../common.mk

# Internals
_clean:
	rm -rf .serverless

_test:
	ruby -I test test/handler_test.rb

build:
	@echo "nothing to build"