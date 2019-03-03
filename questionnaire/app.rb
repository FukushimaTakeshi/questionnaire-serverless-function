require 'json'
require 'aws-sdk'
require 'cgi'
require 'date'

def lambda_handler(event:, context:)
  client = Aws::S3::Client.new(region: 'ap-northeast-1')

  client.put_object(
    bucket: 'questionnaire-on-study-group-fukushima',
    key: "#{Time.now}.json",
    body: CGI.parse(event['body']).to_json
  )

  {
    statusCode: 200,
    body: {
      message: 'OK'
    }.to_json
  }
end
