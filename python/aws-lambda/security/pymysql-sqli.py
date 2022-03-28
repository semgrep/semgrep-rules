import boto3
import base64
import json
import os
import pymysql
import pymysql.cursors

DB_CREDS = os.environ['DB_CREDS']
DB_NAME = os.environ['DB_NAME']

def connection_info(db_creds):
  session = boto3.session.Session()
  client = session.client(
    service_name='secretsmanager'
  )

  get_secret_value_response = client.get_secret_value(SecretId=db_creds)

  if 'SecretString' in get_secret_value_response:
    secret = json.loads(get_secret_value_response['SecretString'])
  else:
    secret = json.loads(base64.b64decode(get_secret_value_response['SecretBinary']))
  
  return secret

def lambda_handler(event, context):
  status_code = 400
  try:
    user_id = event['requestContext']['identity']['cognitoIdentityId']
    sql = '''
          SELECT
            id
            ,userId
            ,stationId
            ,stationName
            ,duration
            ,price
            ,createdDate
          FROM
            rideTransactions
          WHERE
            userId = "{}"
          ORDER BY
            createdDate DESC;
          '''.format(user_id)

    conn_info = connection_info(DB_CREDS)
    conn = pymysql.connect(host=conn_info['host'], user=conn_info['username'], password=conn_info['password'], database=conn_info['dbname'], connect_timeout=30, cursorclass=pymysql.cursors.DictCursor)
    with conn.cursor() as cur:
      # ruleid: pymysql-sqli
      cur.execute(sql)
      rows = cur.fetchall()

      # ok: pymysql-sqli
      cur.execute('SELECT * FROM foobar')
      rows2 = cur.fetchall()
    conn.close()
    output = [{'id': c['id'], 'userId': c['userId'], 'stationId': c['stationId'], 'stationName': c['stationName'], 'duration': c['duration'], 'price': float(c['price']), 'createdDate': c['createdDate'].isoformat()} for c in rows]
    status_code = 200

  except Exception as e:
    print('ERROR: ', e)
    output = '{}'.format(e)

  response = {
    'statusCode': status_code,
    'headers': {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': True,
      'Access-Control-Allow-Headers': 'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,X-Amz-User-Agent',
      'Access-Control-Allow-Methods': 'GET,POST,PUT,DELETE,OPTIONS,HEAD,PATCH',
      'Content-Type': 'application/json'
    },
    'body': json.dumps(output)
  }

  print('[INFO] Query response: {}'.format(json.dumps(response)))

  return response