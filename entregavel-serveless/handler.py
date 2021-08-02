import json
import boto3

def book(event, context):
    body = {
     "book_name":"harry potter",
     "book_id": 34577,
     "book_preco": 45.87
    }
    
    client = boto3.client('sns', region_name='us-east-1')
    response = client.publish(
        TargetArn="arn:aws:sns:us-east-1:692512847841:results-updates-topic",
        Message=json.dumps(body)
    )

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
    
def sell(event, context):
    body = {
        "book_id":2346,
        "customer_id": 12456
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
    
def consumer(event, context):
    print(f"event: %s" % json.dumps(event))
    
    s3 = boto3.resource('s3', region_name='us-east-1')
    s3.Object('lab-fiap-78aoj-339812', 'sqs.json').put(Body=json.dumps(event))

    response = {
        "statusCode": 200,
        "body": {"body": json.dumps(event.body)}
    }
    return response