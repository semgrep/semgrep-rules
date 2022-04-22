import boto3

def handler(event, context):
  dynamodb = boto3.resource('dynamodb')
  dynamodb_table = dynamodb.Table('Name')
  dynamodb_table.query(
    Select = 'ALL_ATTRIBUTES',
    # ruleid: dynamodb-filter-injection
    QueryFilter = event.body.filter
  )

  dynamodb_table.scan(
    Select = 'ALL_ATTRIBUTES', 
    # ok: dynamodb-filter-injection
    ScanFilter = {'first_name': event.body.name}
  )

def new_handler(event, context):
  client = boto3.client('dynamodb')

  client.scan(
    Select = 'ALL_ATTRIBUTES', 
    # ruleid: dynamodb-filter-injection
    ScanFilter = event.body.filter
  )

  client.query(
    Select = 'ALL_ATTRIBUTES', 
    # ok: dynamodb-filter-injection
    QueryFilter = {'first_name': event.body.name}
  )