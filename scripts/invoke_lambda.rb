command = 'aws lambda invoke --function-name rayrays_statuslambda ./response.json --profile dnb-core-app-sandbox'

system command
puts "-----Response JSON-----\n"
system 'cat ./response.json'
