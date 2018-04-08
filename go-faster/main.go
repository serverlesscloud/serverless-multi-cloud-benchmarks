package main

import (
	"context"
	"encoding/json"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// custom handler that doesn't rely on reflection
type handler func() (*events.APIGatewayProxyResponse, error)

// Invoke is required by the interface to pass through byte array received from RPC call
func (h handler) Invoke(ctx context.Context, payload []byte) ([]byte, error) {
	resp, err := h()
	if err != nil {
		return nil, err
	}

	respBytes, err := json.Marshal()
	if err != nil {
		return nil, err
	}

	return respBytes, err
}

var _ lambda.LambdaHander = (handler)(nil)

func main() {
	lambda.StartWrapper(Handler)
}
