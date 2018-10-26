require_relative 'shell_utils'

command = "aws lambda invoke --function-name #{config["function_name"]} /tmp/response.json --profile #{config["profile_name"]}"

execute_and_print command, 'Invoking Lambda'
puts "-----Response JSON-----\n"
system 'cat /tmp/response.json'
