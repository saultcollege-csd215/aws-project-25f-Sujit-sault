import boto3
import os
import uuid
from datetime import datetime, timezone

TABLE_NAME = os.environ.get("DYNAMODB_TABLE", "dice-rolls")

def save_roll_history(roll_result, source):
    try:
        dynamodb = boto3.resource("dynamodb", region_name="us-east-1")
        table = dynamodb.Table(TABLE_NAME)
        
        item = {
            "source": source,
            "timestamp": int(datetime.now(timezone.utc).timestamp() * 1000),
            "result": str(roll_result)
        }
        
        table.put_item(Item=item)
        print(f"Saved to DynamoDB: {item}")
    except Exception as e:
        print(f"Error saving to DB: {e}")