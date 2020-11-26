# AWS Runtimes

## Usage
Default make task will build and deploy all runtimes:

    make

Alternative specify invidual `RUNTIMES` and / or invidual make targets

    RUNTIMES=aws-csharp2.1 make build deploy
    RUNTIMES=aws-go1.x make build deploy
    