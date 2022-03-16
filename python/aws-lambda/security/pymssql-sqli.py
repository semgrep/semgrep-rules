import boto3
import json
import logging
import os
import pymssql

def lambda_handler(event, context):
  current_user = event['user_id']
  secret_dict = get_secret_dict()

  port = str(secret_dict['port']) if 'port' in secret_dict else '1433'
  dbname = secret_dict['dbname'] if 'dbname' in secret_dict else 'master'
  conn = pymssql.connect(server=secret_dict['host'],
                          user=secret_dict['username'],
                          password=secret_dict['password'],
                          database=dbname,
                          port=port,
                          login_timeout=5,
                          as_dict=True)
  cursor = conn.cursor(as_dict=True)

  query = "SELECT roleprin.name FROM sys.database_role_members rolemems "\
          "JOIN sys.database_principals roleprin ON roleprin.principal_id = rolemems.role_principal_id "\
          "JOIN sys.database_principals userprin ON userprin.principal_id = rolemems.member_principal_id "\
          "WHERE userprin.name = '%s'" % current_user
  # ruleid: pymssql-sqli
  cursor.execute(query)

  # ok: pymssql-sqli
  cursor.execute("SELECT * FROM user WHERE id ='%s'", current_user)
  return {
      'statusCode': 200,
      'body': 'ok'
  }