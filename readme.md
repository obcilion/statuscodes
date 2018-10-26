Copy `scripts/deploy_config_template.yaml` to `scripts/deploy_config.yaml` and fill in the values`

#### Initial:  
Manual process in AWS. Create new Lambda and API Gateway

#### Update
Run `scripts/update_lambda.rb` to upload new code

## Test
Run `scripts/invoke_lambda.rb` or send a request to the API Gateway url
