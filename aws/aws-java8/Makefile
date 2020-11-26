RUNTIME=aws-java8
API_URL=$(AWS_JAVA8_URL)

include ../common.mk

# Internals
_clean:
	rm -rf .serverless target

build:
	$(BUILDER) mvn package