const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient();
const tableName = process.env.DYNAMODB_TABLE;

exports.handler = async (event) => {
    const params = {
        TableName: tableName,
        Item: {
            id: event.id,
            data: event.data
        }
    };
    try {
        await dynamodb.put(params).promise();
        return { statusCode: 200, body: 'Item added to DynamoDB' };
    } catch (error) {
        return { statusCode: 500, body: `Unable to add item: ${error}` };
    }
};
