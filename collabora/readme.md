берем текущий ip
подставляем вместь 255.255.255.0 в запросах и docker-compose

http://localhost:9980/office/hosting/discovery
взять url из ответа (http://localhost:9980/office/browser/e39481b90/cool.html?)


http://localhost:9980/office/browser/e39481b90/cool.html?access_token=SMirZKpkVTidTdCD&WOPISrc=http%3A%2F%2F255.255.255.0%3A8081%2Fwopi

curl -X GET http://255.255.255.0:8081/wopi