from pymongo import MongoClient

# ok:mongo-client-bad-auth
client = MongoClient('example.com',
                     username='user',
                     password='password',
                     authSource='the_database',
                     authMechanism='SCRAM-SHA-256')
# ok:mongo-client-bad-auth
client = MongoClient('example.com',
                     username='user',
                     password='password',
                     authSource='the_database',
                     authMechanism='SCRAM-SHA-1')

# ruleid:mongo-client-bad-auth
client = MongoClient('example.com', username='user', password='password', authSource='the_database', authMechanism='MONGODB-CR')
