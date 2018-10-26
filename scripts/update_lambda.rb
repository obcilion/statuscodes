require 'yaml'

def execute_command(command, text)
  puts text
  if system(command)
    puts '***Success***'
    puts "-----------------\n"
  else
    puts '***Failed***'
    exit 1
  end
end

file = File.new(File.join(File.dirname(__FILE__),'deploy_config.yaml'),'r')
config = YAML.load file.read

# Build commands

compile_command = "env GOOS=linux GOARCH=amd64 go build -v -o #{config["bin_path"]}"
zip_command = "zip -j #{config["zip_path"]} #{config["bin_path"]}"
update_command = "aws lambda update-function-code --function-name #{config["function_name"]} --zip-file fileb://#{config["zip_path"]} --profile #{config["profile_name"]}"

# Execute commands
puts '----Starting Lambda Update-----'
execute_command compile_command, 'Compiling'
execute_command zip_command, 'Zipping'
execute_command update_command, 'Updating Lambda'
