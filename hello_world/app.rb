# require 'httparty'
require 'json'
require 'aws-sdk'

def lambda_handler(event:, context:)
  # Sample pure Lambda function

  # Parameters
  # ----------
  # event: Hash, required
  #     API Gateway Lambda Proxy Input Format
  #     Event doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-input-format

  # context: object, required
  #     Lambda Context runtime methods and attributes
  #     Context doc: https://docs.aws.amazon.com/lambda/latest/dg/python-context-object.html

  # Returns
  # ------
  # API Gateway Lambda Proxy Output Format: dict
  #     'statusCode' and 'body' are required
  #     # api-gateway-simple-proxy-for-lambda-output-format
  #     Return doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html

  # begin
  #   response = HTTParty.get('http://checkip.amazonaws.com/')
  # rescue HTTParty::Error => error
  #   puts error.inspect
  #   raise error
  # end

  p event
  p '--------------'
  p context

  client = Aws::S3::Client.new(
            region: 'ap-northeast-1'
          )

  hoge = {
    hoge: 'fuga',
    hogehoge: [
      1,
      2,
      3,
    ]
  }

  client.put_object(
    bucket: 'questionnaire-on-study-group-fukushima',
    key: 'sample.json',
    body: hoge.to_json
  )

  {
    statusCode: 200,
    body: {
      message: hoge,
      # location: response.body
    }.to_json
  }
end
