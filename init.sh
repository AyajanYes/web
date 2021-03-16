sudo ln -sf /home/box/web/etc/nginx.conf 
sudo /etc/init.d/nginx restart
gunicorn -w 2 -c /home/box/web/etc/hello.py hello:app & ask.wsgi:application & curl -vv 'http://127.0.0.1:8080/login/'
sudo /etc/init.d/gunicorn restart
