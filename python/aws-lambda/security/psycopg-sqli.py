import psycopg2
import json

def lambda_handler(event, context):
    ssm = boto3.client('ssm')
    database = ssm.get_parameter(Name = 't2-db-dbname')
    user = ssm.get_parameter(Name = 't2-db-user')
    port = ssm.get_parameter(Name = 't2-db-port')
    tableName = ssm.get_parameter(Name = 't2-db-tablename')
    password = ssm.get_parameter(Name = 't2-db-password', WithDecryption = True)
    host = ssm.get_parameter(Name = 't2-db-host', WithDecryption = True)

    engine = psycopg2.connect(
    database=database['Parameter']['Value'],
    user=user['Parameter']['Value'],
    password=password['Parameter']['Value'],
    host=host['Parameter']['Value'],
    port=port['Parameter']['Value']
    )
    tableName = tableName['Parameter']['Value']

    keyphrase = event['keyphrase']
    username = event['username']
    language = event['translateTarget']

    cur = conn.cursor()
    findQuery = '''SELECT file_name FROM {tableName} WHERE '{keyphrase}' = ANY (keyphrases) AND target_language = '{language}' AND username = '{username}' '''.format(username=username, keyphrase=keyphrase, language=language, tableName = tableName)
    # ruleid: psycopg-sqli
    cur.execute(findQuery)
    result = cur.fetchone()
    returnList = []

    # ok: psycopg-sqli
    cur.execute("SELECT * FROM foobar WHERE id = '%s'", username)

    if (result is None):
        returnList.append('None')
    else:
        for i in range (0,len(result)):
            returnList.append(result[i])
            
    response =  {
        'searchedFiles':returnList,
        'language' : language
        }

    engine.commit()
    engine.close()
    
    return response 