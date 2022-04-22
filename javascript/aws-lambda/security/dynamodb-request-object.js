const AWS = require('aws-sdk')

var documentClient = new AWS.DynamoDB.DocumentClient();

exports.handler = function(event, context) {
  // ruleid: dynamodb-request-object
  documentClient.query(event.body.params, function(err, data) {
    if (err) {
      console.log(err);
    }
    console.log(data);
  });
}

exports.handler = function(event, context) {
  const params = Object.assign({hardcoded: 'params'}, event.body.params)
  // ruleid: dynamodb-request-object
  documentClient.query(params, function(err, data) {
    if (err) {
      console.log(err);
    }
    console.log(data);
  });
}

exports.handler = function(event, context) {
  // ok: dynamodb-request-object
  documentClient.query({
    // this is stupid, but we do not interested in such findings for this rule
    FilterExpression: `${event.body.name} = :s`,
    ExpressionAttributeValues: {
      ":s": { N: "1" }
    },
    KeyConditionExpression: 'STRING_VALUE'
  }, function(err, data) {
    if (err) console.log(err);
    else console.log(data);
  });
}

const { DynamoDBClient, QueryCommand } = require("@aws-sdk/client-dynamodb");
const { DynamoDBDocumentClient, PutCommand } = require("@aws-sdk/lib-dynamodb");

exports.handler = function(event, context) {

  const ddbClient = new DynamoDBClient({ region: 'REGION' });
  const ddbDocClient = DynamoDBDocumentClient.from(ddbClient);
  const { params } = event.body
  // todoruleid: dynamodb-request-object
  const data = await ddbDocClient.send(new QueryCommand(params));
  console.log("Success:", data.Items);

}

exports.handler = function(event, context) {

  const ddbClient = new DynamoDBClient({ region: 'REGION' });
  const ddbDocClient = DynamoDBDocumentClient.from(ddbClient);
  const params = event.body.params
  // ruleid: dynamodb-request-object
  const data = await ddbDocClient.send(new QueryCommand(params));
  console.log("Success:", data.Items);

}

exports.handler = function(event, context) {

  const ddbClient = new DynamoDBClient({ region: 'REGION' });
  const ddbDocClient = DynamoDBDocumentClient.from(ddbClient);
  const params = {
    KeyConditionExpression: "Title = :s",
    ExpressionAttributeValues: {
      ":s": { S: event.body.title }
    },
    ProjectionExpression: "Episode, Title",
    TableName: "TVSHOWS",
  }
  // ok: dynamodb-request-object
  const data = await ddbDocClient.send(new QueryCommand(params));
  console.log("Success:", data.Items);
}
