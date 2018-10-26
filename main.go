package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

type responseMessage struct {
	Message string
}

func status200() (responseMessage, error) {
	return responseMessage{"Success"}, nil
}

func main() {
	lambda.Start(status200)
}