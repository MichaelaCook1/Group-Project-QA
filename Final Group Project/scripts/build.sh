#! /bin/bash
echo $DB_PASSWORD
echo $DB_URI
sudo docker login
sudo docker-compose build   
sudo docker-compose push
