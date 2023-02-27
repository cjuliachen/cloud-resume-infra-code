import json
import os
import boto3

domain = os.environ['domain_name']
d_db_name = os.environ['table_name']

def get_visitor_count(event, context):
    client = boto3.client('dynamodb')
    response = client.update_item(
        TableName = d_db_name,
        Key = {
            'id':{
                'S': 'visitor'}
        },
        UpdateExpression= "SET hits = hits + :incr",
        ExpressionAttributeValues = {
            ':incr': {'N': '1'}
        },
        ReturnValues="UPDATED_NEW",
    )
    response_message = {
    'statusCode': 200,
    'headers': {
        "Content-Type": "application/json",
        'Access-Control-Allow-Origin': 'https://'+ domain,
        'Access-Control-Allow-Methods': 'OPTION, POST',
        'Access-Control-Allow-Headers': 'Content-Type',
    },
    "body": json.dumps({
        "message": "success",
        "count": response['Attributes']['hits']['N']
    }),

}
    return response_message
    