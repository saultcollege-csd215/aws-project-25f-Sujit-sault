#!/bin/bash
LAMBDA_NAME="csd215-lambda"
echo "Step 1: Packaging Lambda function..."
cd app
zip -r ../lambda-deploy.zip .
cd ..
echo "Step 2: Updating Lambda function code..."
aws lambda update-function-code \
    --function-name $LAMBDA_NAME \
    --zip-file fileb://lambda-deploy.zip
echo "Step 3: Lambda deployment complete!"
