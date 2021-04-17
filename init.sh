sudo rm /etc/nginx/sites-enabled/test.conf
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

sudo ln -s /home/box/web/etc/hello.py /etc/gunicorn.d/hello.py
sudo /etc/init.d/gunicorn restart

sudo /etc/init.d/mysql start
#sudo systemctl start mariadb
#mysql -uroot -e "DROP DATABASE IF EXISTS askappdb;"
#mysql -uroot -e "DROP USER 'askapp'@'localhost';" mysql
mysql -uroot -e "CREATE DATABASE qa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -uroot -e "CREATE USER 'root'@'localhost' IDENTIFIED BY 'passwrd123';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON qa.* TO 'root'@'localhost';"
mysql -uroot -e "FLUSH PRIVILEGES;"

sudo python ~/web/ask/manage.py makemigrations qa
sudo python ~/web/ask/manage.py migrate
