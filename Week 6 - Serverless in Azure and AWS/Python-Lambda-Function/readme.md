# What's Used

## Serverless Framework
The serverless framework has become the go-to tool to develop AWS Lambda functions and for good reasons: With a properly configured AWS account you can get started with Lambda extremely quickly.

Think of it like a command-line tool to get Lambda functions up and running

https://www.serverless.com/

### Installing Serverless
1. Ensure that you have NPM install (package manager for JavaScript)
2. Run `npm install -g serverless`
3. Create a serverless template - `serverless create --template aws-python3`
4. Update the `serverless.yml` to include the following line under `handler:`

```
    events:
      - http:
          path: /
          method: get
```

This will allow you to reach the AWS Lambda function from a URL

5. Run `serverless deploy`

## Zappa
Zappa makes it super easy to build and deploy server-less, event-driven Python applications (including, but not limited to, WSGI web apps) on AWS Lambda + API Gateway. Think of it as "serverless" web hosting for your Python apps. That means infinite scaling, zero downtime, zero maintenance - and at a fraction of the cost of your current deployments!

https://github.com/Miserlou/Zappa


## Chalice
Chalice is the official "AWS way" of creating Lambda functions. The only negative here is you can't use one of your existing Flask applications. You have to use the `Chalice` SDK. Luckily, the code looks pretty similar to how you would build a Flask app anyways. 

https://aws.github.io/chalice/