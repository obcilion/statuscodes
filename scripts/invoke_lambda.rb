require 'yaml'

file = File.new(File.join(File.dirname(__FILE__),'deploy_config.yaml'),'r')
config = YAML.load file.read

command = "aws lambda invoke --function-name #{config["function_name"]} /tmp/response.json --profile #{config["profile_name"]}"

system command
puts "-----Response JSON-----\n"
system 'cat /tmp/response.json'
