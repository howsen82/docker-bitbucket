sudo apt update
sudo apt install -y postgresql apache2 apt-transport-https certbot python3-certbot-apache fontconfig
sudo a2enmod proxy_http
sudo a2enmod rewrite
sudo vim /etc/apache2/sites-available/bitbucket.heyvaldemar.net.conf
sudo vim /etc/apache2/sites-available/bitbucket.heyvaldemar.net-ssl.conf
sudo a2ensite bitbucket.heyvaldemar.net.conf
sudo a2ensite bitbucket.heyvaldemar.net-ssl.conf
sudo a2dissite 000-default.conf
sudo apache2ctl configtest
sudo systemctl restart apache2
sudo systemctl status apache2
sudo certbot --apache -d bitbucket.heyvaldemar.net
sudo certbot renew --dry-run
sudo su - postgres
psql

CREATE USER bitbucketdbuser WITH PASSWORD 'mU%g673b=6])?8E6R9M3T';
CREATE DATABASE bitbucketdb WITH OWNER "bitbucketdbuser" ENCODING='UTF8' CONNECTION LIMIT=-1;
\q
exit

wget https://www.atlassian.com/software/stash/downloads/binary/atlassian-bitbucket-7.12.0-x64.bin
sudo chmod +x atlassian-bitbucket-7.12.0-x64.bin
sudo ./atlassian-bitbucket-7.12.0-x64.bin
sudo vim /var/atlassian/application-data/bitbucket/shared/bitbucket.properties
sudo service atlbitbucket start
sudo less /var/atlassian/application-data/bitbucket/log/atlassian-bitbucket.log
