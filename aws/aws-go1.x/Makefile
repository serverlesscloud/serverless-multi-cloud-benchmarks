RUNTIME=aws-go1.x
API_URL=$(AWS_GO1_X_URL)

include ../common.mk

# Internals
_clean:
	rm -rf .serverless bin

_build:
	go get -u github.com/aws/aws-lambda-go/lambda && \
	go get -u github.com/aws/aws-lambda-go/events && \
	env GOOS=linux go build -ldflags='-w -s' -o bin/main
