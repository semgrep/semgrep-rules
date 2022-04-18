import boto3

def handler(event, context):
  dynamodb = boto3.resource('dynamodb')
  dynamodb_table = dynamodb.Table('Name')
  dynamodb_table.query(
    Select = 'ALL_ATTRIBUTES',
    # ruleid: dynamodb-request-object
    QueryFilter = event.body.filter
  )

  dynamodb_table.scan(
    Select = 'ALL_ATTRIBUTES', 
    # ok: dynamodb-request-object
    ScanFilter = {'first_name': event.body.name}
  )

def new_handler(event, context):
  client = boto3.client('dynamodb')

  client.scan(
    Select = 'ALL_ATTRIBUTES', 
    # ruleid: dynamodb-request-object
    ScanFilter = event.body.filter
  )

  client.query(
    Select = 'ALL_ATTRIBUTES', 
    # ok: dynamodb-request-object
    QueryFilter = {'first_name': event.body.name}
  )