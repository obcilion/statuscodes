require 'yaml'
require 'open3'

def execute_and_print(command, text)
  puts "-----#{text}-----"
  puts "Running command: #{command}"
  puts '-----Output-----'
  output, status = Open3.capture2(command)
  print output == '' ? "\n" : output
  if status == 0
    puts '-----Success-----'
    puts ''
  else
    puts '-----Failed-----'
    exit 1
  end
  output
end

def config
  return @config if @config

  file = File.new(File.join(File.dirname(__FILE__),'deploy_config.yaml'),'r')
  @config = YAML.load file.read
end

def build_command(base, arguments)
  arguments.each_pair do |key, value|
    base << " --#{key} #{value}"
  end
  base
end
