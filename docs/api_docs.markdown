# Bank accounting API

The body parameters of all GET request must be set by querystring, for another verbs, it should be passed in JSON format.

All answers will be served in JSON format.

All endpoints above will be prefixed with url "/v1/"

## Account Balance: GET - /account/{accountId}/balance
Return the balance of given account. Each return has the folloowing content:

| Attribute | Type | Description |
| --------- | -----| --------- |
| balance | float | Account balance |

**Example of usage:**

**Request**
```
GET /v1/account/{accountId}/balance HTTP/1.1
```

**cURL**
```
curl -X GET \
  http://localhost:3000/v1/account/1/balance \
```

**Response**
```
{
    "balance": 3000
}
```

## Transfer ammount: POST - /account/{sourceAccountId}/transfer
Makes a amount of money transfer between two accounts. This request receives these parameters:

| Attribute | Type | Description | Mandatory |
| --------- | -----| --------- | ---------- |
| destination_account_id | int | Destination account id | true |
| amount | float | Amount of money to be transfered | true |

**Example of usage:**

**Request**
```
POST /v1/account/4/transfer HTTP/1.1
Host: localhost:3000
Content-Type: application/json

{
  "destination_account_id": 1,
  "amount": 3000
}
```

**cURL**
```
curl -X POST \
  http://localhost:3000/v1/account/4/transfer \
  -H 'content-type: application/json' \
  -d '{
  "destination_account_id": 1,
  "amount": 3000
}'
```

**Response:** HTTP 201 (CREATED)
