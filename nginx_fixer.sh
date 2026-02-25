#!/bin/bash
echo "Updating your system..."
sudo apt update -qq && sudo apt upgrade -y > /dev/null 2>&1
echo "Installing Nginx..."
sudo apt install nginx -y > /dev/null 2>&1
(
cd /var/www/html || exit
echo "Creating the page HTML files..."
for i in {1..3}; do
	html_file="page$i.html"
	sudo touch $html_file
	sudo chmod 644 $html_file
	sudo chown www-data $html_file
done
)
if systemctl is-active -q nginx; then
	echo "Nginx is running. Force restarting now..."
	sudo systemctl restart nginx
	journalctl -u nginx | tail -n 5
else
	echo "Nginx is dead. Starting it now..."
	sudo systemctl start nginx
	journalctl -u nginx | tail -n 5
fi
