import json
import os
import typing as t

import boto3
import sqlalchemy
from aws_lambda_powertools import Logger, Tracer
from aws_lambda_powertools.utilities.typing import LambdaContext

SERVICE = "lambda-connection-pooling-demo"
logger = Logger(service=SERVICE)
tracer = Tracer(service=SERVICE)

class LambdaProxyIntegrationResponse(t.TypedDict, total=False):
    statusCode: int
    body: str
    headers: t.Dict[str, t.Any]

DB_USER_SECRET_NAME = os.environ.get("DB_USER_SECRET_NAME")
DB_HOST = os.environ.get("DB_HOST")

secrentsmanager = boto3.client(service_name='secretsmanager')
get_secret_value_response = secrentsmanager.get_secret_value(SecretId=DB_USER_SECRET_NAME)
secret = json.loads(get_secret_value_response["SecretString"])
db_user = secret["username"]
db_password = secret["password"]
db_host = DB_HOST or secret["host"]
db_port = secret["port"]

url = f"mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/"
engine = sqlalchemy.create_engine(
    url,
    connect_args={
        "ssl": {
            "ssl_ca": "./AmazonRootCA1.pem",
        }
    },
    pool_recycle=50,
)

def handler(event, context):
    logger.debug("connecting to db...")
    with engine.connect() as connection:
        try:
            # ruleid: sqlalchemy-sqli
            connection.execute(f"SELECT * FROM foobar WHERE id = '{event['id']}'")
            # ok: sqlalchemy-sqli
            connection.execute("SELECT * FROM foobar WHERE id = '?'", event['id'])
        except Exception as e:
            logger.error("An error occured:")
            print(e)
            return {
                "statusCode": 200,
                "body": json.dumps({
                    "state": "ERROR",
                    "message": f"response from '{context.log_stream_name}'"
                })
            }
    return {
        "statusCode": 200,
        "body": json.dumps({
            "state": "SUCCESS",
            "message": f"response from '{context.log_stream_name}'"
        })
    }