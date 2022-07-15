import json
import secret_info
import mysql.connector

RemoteMysql = secret_info.RemoteMysql

mydb = mysql.connector.connect(host=RemoteMysql.host, user=RemoteMysql.user, passwd=RemoteMysql.passwd, database=RemoteMysql.database)
mydbCursor = mydb.cursor()

def lambda_handler(event, context):
    publicIP=event["queryStringParameters"]["publicIP"]
    sql = """UPDATE `EC2ServerPublicIP` SET %s = '%s' WHERE %s = %d""" % ("publicIP",publicIP,"ID", 1)
    # ruleid: mysql-sqli
    mydbCursor.execute(sql)

    # ok: mysql-sqli
    mydbCursor.execute("UPDATE `EC2ServerPublicIP` SET %s = '%s' WHERE %s = %s", ("publicIP",publicIP,"ID", 1))
    mydb.commit()
    
    Body={
        "publicIP":publicIP
        
    }
    return {
        'statusCode': 200,
        'body': json.dumps(Body)
    }