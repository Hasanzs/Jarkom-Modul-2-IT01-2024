Nusantara(){
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.64.0.0/16
}
Bedahulu(){
    echo "nameserver 10.64.1.2
    nameserver 10.64.3.2" > /etc/resolv.conf

    apt-get update
    apt-get install apache2 -y
    apt-get install lynx -y

    echo '<VirtualHost *:80>
    	ServerName 10.64.1.4

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/html

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

    </VirtualHost>


    ' > /etc/apache2/sites-available/000-default.conf

    service apache2 restart
}


Kotalingga(){
    echo "nameserver 10.64.1.2
    nameserver 10.64.3.2" > /etc/resolv.conf
    apt-get update
    apt-get install apache2 -y
    apt-get install lyns -y
    a2enmod proxy
    a2enmod proxy_http
    echo '<VirtualHost *:80>
    	ServerName 10.64.1.6

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/html

        ProxyPass /sudarsana http://www.sudarsana.it01.com
    	ProxyPassReverse /sudarsana http://www.sudarsana.it01.com

    	ProxyPass /pasopati http://www.pasopati.it01.com
    	ProxyPassReverse /pasopati http://www.pasopati.it01.com

    	ProxyPass /rujapala http://www.rujapala.it01.com
    	ProxyPassReverse /rujapala http://www.rujapala.it01.com

    	ProxyPass /cakra http://www.cakra.sudarsana.it01.com
    	ProxyPassReverse /cakra http://www.cakra.sudarsana.it01.com

    	ProxyPass /panah http://www.panah.pasopati.it01.com
    	ProxyPassReverse /panah http://www.panah.pasopati.it01.com

    	ProxyPass /log.panah http://www.log.panah.pasopati.it01.com
    	ProxyPassReverse /logpanah http://www.log.panah.pasopati.it01.com
        ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
    ' > /etc/apache2/sites-available/000-default.conf

    service apache2 restart
}

Gajahmada(){
    echo '
    nameserver 10.64.1.2
    nameserver 10.64.3.2' > /etc/resolv.conf

    apt-get update
    apt-get install dnsutils -y
}

HayamWuruk(){
    echo 'nameserver 10.64.1.2
    nameserver 10.64.3.2' > /etc/resolv.conf

    apt-get update
    apt-get install dnsutils -y
    }

Majapahit(){
    echo 'nameserver 192.168.122.1' > /etc/resolv.conf
    echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
    sysctl -p
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    apt-get update
    apt-get install bind9 -y
    echo 'zone "sriwijaya.com" {
	    type slave;
	    masters { 10.64.1.2; }; // Masukan IP EniesLobby tanpa tanda petik
	    file "/var/lib/bind/jarkom2022.com";
    };


    zone "sudarsana.it01.com" {
    	type slave;
    	masters { 10.64.1.2; }; // Masukan IP EniesLobby tanpa tanda petik
    	file "/var/lib/bind/sudarsana.it01.com";
    };

    zone "pasopati.it01.com" {
    	type slave;
    	masters { 10.64.1.2; }; // Masukan IP EniesLobby tanpa tanda petik
    	file "/var/lib/bind/pasopati.it01.com";
    };

    zone "panah.pasopati.it01.com" {
        	type master;
        	file "/etc/bind/delegasi/panah.pasopati.it01.com";
    };
    zone "rujapala.it01.com" {
    	type slave;
       masters { 10.64.1.2; }; // Masukan IP EniesLobby tanpa tanda petik
    	file "/var/lib/bind/rujapala.it01.com";
    };
     ' > /etc/bind/named.conf.local

    mkdir /etc/bind/delegasi
    cp /etc/bind/db.local /etc/bind/delegasi/panah.pasopati.it01.com

    echo ';
    ; BIND data file for local loopback interface
    ;
    $TTL	604800
    @   	IN  	SOA 	panah.salopati.it01.com. panah.salopati.it01.com. (
                        	2024100203  	; Serial
                        	604800      	; Refresh
                        	86400       	; Retry
                        	2419200     	; Expire
                        	604800 )    	; Negative Cache TTL
    ;
    @   	IN  	NS          	panah.salopati.it01.com.
    @   	IN  	A           	10.64.1.6
    @   	IN  	AAAA        	::1
    www 	IN  	CNAME   panah.salopati.it01.com.
    log 	IN  	A           	10.64.1.6
    www.log IN  	CNAME   log.panah.salopati.it01.com. ' > /etc/bind/delegasi

    echo ' options {
        	directory "/var/cache/bind";

         	forwarders {
          	192.168.122.1;
         	};

        	allow-query{ any ;};
        	auth-nxdomain no;	# conform to RFC1035
        	listen-on-v6 { any; };
    };

    ' > /etc/bind/named.conf.options

    service bind9 restart

}




Solok(){
    echo "nameserver 10.64.1.2
    nameserver 10.64.3.2" > /etc/resolv.conf
    apt-get update
    apt-get install apache2 -y
    apt install libapache2-mod-proxy-html libapache2-mod-php7.0 build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev lib$
    apt-get install lynx -y
    apt-get install nginx -y
    apt-get install lsof -y
    a2enmod proxy
    a2enmod proxy_http
    a2enmod proxy_balancer
    a2enmod lbmethod_byrequests
    a2enmod lbmethod_bytraffic
    a2enmod rewrite
    echo '	<Proxy balancer://roundrobin>
        	BalancerMember http://10.64.1.4:80
        	BalancerMember http://10.64.1.5:80
        	BalancerMember http://10.64.1.6:80
    	</Proxy>

    	<Proxy balancer://leastconn>
        	BalancerMember http://10.64.1.4:80
        	BalancerMember http://10.64.1.5:80
        	BalancerMember http://10.64.1.6:80
        	ProxySet lbmethod=bytraffic
    	</Proxy>

    	<Proxy balancer://weightedrr>
        	ProxySet lbmethod=byrequests
        	ProxySet stickysession=ROUTEID
        	BalancerMember http://10.64.1.4:80
        	BalancerMember http://10.64.1.5:80
        	BalancerMember http://10.64.1.6:80
    	</Proxy>
    <VirtualHost *:31416>
    	ServerName 10.64.3.3


    	RewriteEngine On
    	RewriteCond %{HTTP_HOST} ^roundrobin\.Solok\.it01\.com$ [NC]
    	RewriteRule ^/(.*)$ balancer://roundrobin/$1 [P,L]

    	RewriteCond %{HTTP_HOST} ^leastconn\.Solok\.it01\.com$ [NC]
    	RewriteRule ^/(.*)$ balancer://leastconn/$1 [P,L]

    	RewriteCond %{HTTP_HOST} ^weightedrr\.Solok\.it01\.com$ [NC]
    	RewriteRule ^/(.*)$ balancer://weightedrr/$1 [P,L]

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/html

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

    </VirtualHost>
    <VirtualHost *:4697>
    	ServerName 10.64.3.3


    	RewriteEngine On
    	RewriteCond %{HTTP_HOST} ^roundrobin\.Solok\.it01\.com$ [NC]
    	RewriteRule ^/(.*)$ balancer://roundrobin/$1 [P,L]

    	RewriteCond %{HTTP_HOST} ^leastconn\.Solok\.it01\.com$ [NC]
    	RewriteRule ^/(.*)$ balancer://leastconn/$1 [P,L]

    	RewriteCond %{HTTP_HOST} ^weightedrr\.Solok\.it01\.com$ [NC]
    	RewriteRule ^/(.*)$ balancer://weightedrr/$1 [P,L]

    	ServerAdmin webmaster@localhost
    	DocumentRoot /var/www/html

    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined

    </VirtualHost>

    ' > /etc/apache2/sites-available/000-default.conf
    a2ensite 000-default.conf
    service apache2 restart

    echo '
    upstream roundrobin_backend {
        	server 10.64.2.3;
        	server 10.64.2.4;
        	server 10.64.2.5;
    }

    upstream leastconn_backend {
        	least_conn;
        	server 10.64.2.3;
        	server 10.64.2.4;
        	server 10.64.2.5;
    }


    server {
        	listen 80;
        	server_name hai.com;

        	location /roundrobin {
                	proxy_pass http://roundrobin_backend;
        	}

        	location /leastconn {
                	proxy_pass http://leastconn_backend;
       	}

    }
    ' > /etc/nginx/sites-available/default

    service nginx restart

    lsof -i:80

    ab -n 1000 -c 100 http://roundrobin.Solok.it01.com/
    ab -n 1000 -c 100 http://leastconn.Solok.it01.com/
    ab -n 1000 -c 100 http://weightedrr.Solok.it01.com/

    echo '<VirtualHost *:80>
        	ServerName sekiantterimakasih.it01.com
        	ServerAlias www.sekiantterimakasih.it01.com

        	DocumentRoot /var/www/worker2

        	<Directory /var/www/worker2>
        	Options Indexes FollowSymLinks
        	AllowOverride None
        	Require all granted
        	</Directory>
    </VirtualHost>
    ' > /etc/apache2/sites-available/sekianterimakasih.conf

    mkdir /var/www/worker2
    chown -R www-data:www-data /var/www/worker2
    chmod -R 755 /var/www/worker2

    a2ensite sekianterimakasih.conf
    service apache2 restart
}
Sriwijaya(){

    echo "nameserver 192.168.122.1" > /etc/resolv.conf
    echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
    sysctl -p
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
     apt-get update
     apt-get install bind9 -y
    echo 'zone "sriwijaya.com" {
        	type master;
    	notify yes;
    	also-notify { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
    	allow-transfer { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
        	file "/etc/bind/jarkom/sriwijaya.com";
    };

    zone "sudarsana.it01.com" {
        	type master;
    	notify yes;
    	also-notify { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
    	allow-transfer { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
        	file "/etc/bind/jarkom/sudarsana.it01.com";
    };

    zone "pasopati.it01.com" {
        	type master;
    	notify yes;
    	also-notify { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
    	allow-transfer { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
        	file "/etc/bind/jarkom/pasopati.it01.com";
    };

    zone "rujapala.it01.com" {
        	type master;
    	notify yes;
    	also-notify { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
    	allow-transfer { 10.64.3.2; }; // Masukan IP Water7 tanpa tanda petik
        	file "/etc/bind/jarkom/rujapala.it01.com";
    };

    zone "2.64.10.in-addr.arpa" {
    	type master;
    	file "/etc/bind/jarkom/2.64.10.in-addr.arpa";
    };' > /etc/bind/named.conf.local
    mkdir /etc/bind/jarkom
    cp /etc/bind/db.local /etc/bind/jarkom/sriwijaya.com
    echo ';
    ; BIND data file for local loopback interface
    ;
    $TTL	604800
    @   	IN  	SOA 	sriwijaya.com. root.sriwijaya.com. (
                        	2024100101  	; Serial
                        	604800      	; Refresh
                        	86400       	; Retry
                       	2419200     	; Expire
                        	604800 )    	; Negative Cache TTL
    ;
    @   	IN  	NS  	sriwijaya.com.
    @   	IN  	A   	10.64.1.2
    @   	IN  	AAAA	::1


    ' > /etc/bind/jarkom/sriwijaya.com
    service bind9 restart


    cp /etc/bind/db.local /etc/bind/jarkom/sudarsana.it01.com
    cp /etc/bind/db.local /etc/bind/jarkom/pasopati.it01.com
    cp /etc/bind/db.local /etc/bind/jarkom/rujapala.it01.com
    cp /etc/bind/db.local /etc/bind/jarkom/2.64.10.in-addr.arpa
    echo ';
    ; BIND data file for local loopback interface
    ;
    $TTL	604800
    @   	IN  	SOA 	sudarsana.it01.com. root.sudarsana.it01.com. (
                        	2024100102  	; Serial
                        	604800      	; Refresh
                        	86400       	; Retry
                        	2419200     	; Expire
                        	604800 )    	; Negative Cache TTL
    ;
    @   	IN  	NS          	sudarsana.it01.com.
    @   	IN  	A           	10.64.3.2
    @   	IN  	AAAA        	::1
    www 	IN  	CNAME   sudarsana.it01.com.
    cakra   IN  	A   	10.64.2.5' > /etc/bind/jarkom/sudarsana.it01.com

    echo ';
    ; BIND data file for local loopback interface
    ;
    $TTL	604800
    @   	IN  	SOA 	pasopati.it01.com. root.pasopati.it01.com. (
                        	2024100103  	; Serial
                        	604800      	; Refresh
                        	86400       	; Retry
                        	2419200     	; Expire
                        	604800 )    	; Negative Cache TTL
    ;
    @   	IN  	NS          	pasopati.it01.com.
    @   	IN  	A           	10.64.1.6
    @   	IN  	AAAA        	::1
    www 	IN  	CNAME   pasopati.it01.com.
    ns1 	IN  	A   	10.64.3.2
    panah   IN  	NS  	ns1 ' > /etc/bind/jarkom/pasopati.it01.com

    echo ';
    ; BIND data file for local loopback interface
    ;
    $TTL	604800
    @   	IN  	SOA 	rujapala.it01.com. root.rujapala.it01.com. (
                        	2024100104  	; Serial
                        	604800      	; Refresh
                        	86400       	; Retry
                        	2419200     	; Expire
                        	604800 )    	; Negative Cache TTL
    ;
    @   	IN  	NS          	rujapala.it01.com.
    @   	IN  	A           	10.64.3.2
    @   	IN  	AAAA        	::1
    www 	IN  	CNAME   rujapala.it01.com.
    @   	IN  	A           	10.64.3.2
    @   	IN  	AAAA        	::1
    www 	IN  	CNAME   rujapala.it01.com.


    ' > /etc/bind/jarkom/rujapala.it01.com

    echo ';
    ; BIND data file for local loopback interface
    ;
    $TTL	604800
    @   	IN  	SOA 	pasopati.it01.com. root.pasopati.it01.com. (
                        	2024100201  	; Serial
                        	604800      	; Refresh
                        	86400       	; Retry
                        	2419200     	; Expire
                        	604800 )    	; Negative Cache TTL
    ;
    2.64.10.in-addr.arpa.   IN  	NS  	pasopati.it01.com.
    2                   	IN  	PTR 	pasopati.it01.com. ' > /etc/bind/jarkom/2.64.10.in-addr.arpa

service bind9 restart
}

Tanjungkulai(){
    echo "nameserver 10.64.1.2
    nameserver 10.64.3.2" > /etc/resolv.conf

    apt-get update
    apt-get install apache2 -y
    apt-get install lynx -y

    echo '<VirtualHost *:80>
        	ServerName 10.64.1.5

        	ServerAdmin webmaster@localhost
        	DocumentRoot /var/www/html


        	ErrorLog ${APACHE_LOG_DIR}/error.log
        	CustomLog ${APACHE_LOG_DIR}/access.log combined

    </VirtualHost>

    ' > /etc/apache2/sites-available/000-default.conf
    service apache2 restart

}

ThomasAlfaEdison(){
    echo 'nameserver 10.64.1.2
    nameserver 10.64.3.2' > /etc/resolv.conf

    apt-get update
    apt-get install dnsutils -y

}











