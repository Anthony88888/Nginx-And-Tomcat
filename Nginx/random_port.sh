#!/bin/bash
http_num=$(($RANDOM%888))
http_port=$[7001+$http_num]
echo $http_port >> ./http_port.log

sed -i "s/default.*/default $http_port;/" /usr/local/nginx/conf/random_port/geo_http.conf 
sed -i "s/listen.*/listen $http_port;/" /usr/local/nginx/conf/random_port/random_port.conf

systemctl reload nginx