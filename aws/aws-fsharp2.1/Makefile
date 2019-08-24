RUNTIME=aws-fsharp2.1
API_URL=$(AWS_FSHARP2_1_URL)

include ../common.mk

# Internals
_clean:
	rm -rf .serverless bin obj

_build:
	dotnet restore && \
		dotnet lambda package -c release -f netcoreapp2.1 --o bin/release/netcoreapp2.1/publish/deploy-package.zip
