require_relative 'shell_utils'

command = build_command(
              'aws lambda create-function',
              {
                  'function-name': config['function_name'],
                  runtime: config['runtime'],
                  role: config['role_arn'],
                  handler: 'main',
                  'zip-file': "fileb://#{config['zip_path']}",
                  profile: config['profile_name']
              }
)

execute_and_print command, 'Creating new lambda'
