#/bin/bash 

prod() {
  export PATH=$PATH:~/.local/bin/
  aws ssm get-parameters --region ap-southeast-2 --names username password database host dialect --with-decryption --query 'Parameters[*].{key:Name,value:Value}' | jq from_entries | jq "{ $NODE_ENV : .}" > ./database.json
}

if [ "$NODE_ENV" = "production" ]; then
    prod
    cat ./database.json
    httpd -D FOREGROUND
else
    echo "not production"
    echo '{"username":"admin", "password": "t", "dbname":"ad", "hostname": "mydbhost"}' | jq '{ "production" : .}' > ./database.json
    cat ./database.json
    httpd -D FOREGROUND
fi
