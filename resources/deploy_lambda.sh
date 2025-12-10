#!/bin/bash
LAMBDA_NAME="csd215-lambda"
cd app
zip -r ../lambda-deploy.zip .
aws lambda update-function-code --function-name $LAMBDA_NAME --zip-file fileb://../lambda-deploy.zip
