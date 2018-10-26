require_relative 'shell_utils'

# Build commands
# TODO: use string.concat to split commands into multiple lines for clarity

compile_command = "env GOOS=linux GOARCH=amd64 go build -v -o #{config["bin_path"]}"
zip_command = "zip -j #{config["zip_path"]} #{config["bin_path"]}"
update_command = build_command(
    'aws lambda update-function-code',
    {
        'function-name': config["function_name"],
        'zip-file': "fileb://#{config['zip_path']}",
        profile: config["profile_name"]
    })

# Execute commands
puts '----Starting Lambda Update-----'
puts ''
execute_and_print compile_command, 'Compiling'
execute_and_print zip_command, 'Zipping'
execute_and_print update_command, 'Updating Lambda'
puts '-----Done-----'
