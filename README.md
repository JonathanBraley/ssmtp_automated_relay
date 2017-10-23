# ssmtp_automated_relay
ssmtp automated docker container

##Environment variables

RELAY_USER must contain the login for the smtp relay.
RELAY_PASSWORD must contain the password associated to the smtp relay login.
RELAY_SERVER must contain the relay server name + port like so: mail.gandi.net:587
RELAY_HOSTNAME must contain the server hostname. 

Those are all the obligatory variables.
FROM_OVERRIDE by default it's set to false you can put anithing into the variable as long as it's set, it will uncomment the line. For a better reading of composer file set it to true.
RELAY_TLS same as FROM_OVERRIDE, can take any value as long as it's set it will uncomment the line.
