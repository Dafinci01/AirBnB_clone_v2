#!/usr/bin/env bash


#update package lists 
sudo apt update


#install nginx 
if ! which nginx >/dev/null 2>&1; then
	echo "installing Nginx..."
	sudo apt install -y nginx
	sudo ufw allow 'Nginx HTTP'
fi

#create data directory and parents with ownwership
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html


#update symbolc link to current release
sudo ln -s -f /data/web_static/releases/test/data/web_static/current


#
sudo chown -R ubuntu:ubuntu /data/

#
sudo sed -i '/listen 80 default_server /a locatio /hbnb_static  { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default

sudo service  restart nginx

echo "web server setup complete!"
