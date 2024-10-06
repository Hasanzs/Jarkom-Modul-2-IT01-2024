# Jarkom-Modul-2-IT01-2024


## ***KELOMPOK IT 01***
| Nama      | NRP         |
  |-----------|-------------|
  | Aras Rizky Ananta| 5027221053   |
  | Hasan | 5027231073  |  

### Konfigurasi Awal
#### Prefix IP IT01
`10.64`


### Topologi 1
#### Contoh
![1](https://github.com/user-attachments/assets/d74665a2-2b25-435c-b77a-e91cdfa4c98d)


#### Hasil Pembuatan Topologi IT01
![image](https://github.com/user-attachments/assets/d0463878-c7f9-4a1a-9810-4eb2c21c66a8)

## No.01
### Step
Setup Awal
1. Nusantara
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.64.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
        address 10.64.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 10.64.3.1
	netmask 255.255.255.0
```
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.64.0.0/16
```
2. HayamWuruk
```
auto eth0
iface eth0 inet static
	address 10.64.1.3
	netmask 255.255.255.0
	gateway 10.64.1.1
```
3. Sriwijaya
```
auto eth0
iface eth0 inet static
	address 10.64.1.2
	netmask 255.255.255.0
	gateway 10.64.1.1
```
4. Tanjungkulai
```
auto eth0
iface eth0 inet static
	address 10.64.1.4
	netmask 255.255.255.0
	gateway 10.64.1.1
```
5. Bedahulu
```
auto eth0
iface eth0 inet static
	address 10.64.1.5
	netmask 255.255.255.0
	gateway 10.64.1.1
```
6. Kotalingga
```
auto eth0
iface eth0 inet static
	address 10.64.1.6
	netmask 255.255.255.0
	gateway 10.64.1.2
```
7. GajahMada
```
auto eth0
iface eth0 inet static
	address 10.64.2.2
	netmask 255.255.255.0
	gateway 10.64.2.1
```
8. ThomasAlfaEdison
```
auto eth0
iface eth0 inet static
	address 10.64.2.3
	netmask 255.255.255.0
	gateway 10.64.2.1
```
9. Majapahit
```
auto eth0
iface eth0 inet static
	address 10.64.3.2
	netmask 255.255.255.0
	gateway 10.64.3.1
```
10. Solok
```
auto eth0
iface eth0 inet static
	address 10.64.3.3
	netmask 255.255.255.0
	gateway 10.64.3.1
```
## No.02
### Step
#### Sriwijaya
1. Install
```
apt-get install bind9 -y
```
2. Menambahkan zona baru di named.conf.local
```
zone "sudarsana.it01.com" {
        	type master;
        	file "/etc/bind/jarkom/sudarsana.it01.com";
    };
```
3. Buat file setup
```
cp /etc/bind/db.local /etc/bind/jarkom/sudarsana.it01.com
```
```
;
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
```
4. Restart
```
service bind9 restart
```
## No.3
### Step
#### Sriwijaya
1. Menambahkan zona baru
```
zone "pasopati.it01.com" {
        	type master;
        	file "/etc/bind/jarkom/pasopati.it01.com";
    };
```
2. Buat file setup
```
cp /etc/bind/db.local /etc/bind/jarkom/pasopati.it01.com
```
```
;
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
```
3. Restart
```
service bind9 restart
```
## No.04
### Step
#### Sriwijaya
1. Menambahkan zona baru
```
zone "rujapala.it01.com" {
        	type master;
        	file "/etc/bind/jarkom/rujapala.it01.com";
    };
```
2. Buat file setup
```
cp /etc/bind/db.local /etc/bind/jarkom/rujapala.it01.com
```
```
;
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
```
3. Restart
```
service bind9 restart
```
## No.05
### Step
#### Sriwijaya && Majapahit
1. Menambah forwarding
```
net.ipv4.ip_forward=1
```
2. Restart && Tambah alamat
```
sysctl -p
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
#### Setiap node kecuali Sriwijaya && Majapahit di resolv.conf
```
nameserver 10.64.1.2
nameserver 10.64.3.2
```
## No.06
### Step
#### Sriwijaya
1. Reverse DNS
```
    zone "2.64.10.in-addr.arpa" {
    	type master;
    	file "/etc/bind/jarkom/2.64.10.in-addr.arpa";
    };' > /etc/bind/named.conf.local
```
2. Buat file setup
```
    cp /etc/bind/db.local /etc/bind/jarkom/2.64.10.in-addr.arpa
```
```
;
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
    2                   	IN  	PTR 	pasopati.it01.com.
```
## No.07
### Step
#### Sriwijaya
1. Modifikasi menjadi master
```
zone "sriwijaya.com" {
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
```
#### Majapahit
1. Install
```
apt-get install bind9 -y
```
2. Tambah zona slave baru
```
zone "sriwijaya.com" {
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
    zone "rujapala.it01.com" {
    	type slave;
       masters { 10.64.1.2; }; // Masukan IP EniesLobby tanpa tanda petik
    	file "/var/lib/bind/rujapala.it01.com";
    };
```
## No.08
### Step
#### Sriwijaya
1. Modifikasi Sriwjaya setup file seperti ini
```
;
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
    cakra   IN  	A   	10.64.2.5
```
## No.09
### Step
#### Sriwijaya
1. Modifikasi Sriwijaya setup file seperti ini
```
;
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
    panah 	IN  	A   	10.64.3.2
```
## No.10
### Step
#### Sriwijaya
1. Modifikasi Sriwijaya setup file seperti ini
```
;
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
    panah 	IN  	A   	10.64.3.2
    ns1 	IN  	A   	10.64.3.2
    panah   IN  	NS  	ns1
```
#### Majapahit
1. Tambah zona baru
```
 zone "pasopati.it01.com" {
    	type slave;
    	masters { 10.64.1.2; }; // Masukan IP EniesLobby tanpa tanda petik
    	file "/var/lib/bind/pasopati.it01.com";
    };
```
2. Buat file baru
```
cp /etc/bind/db.local /etc/bind/delegasi/panah.pasopati.it01.com
```
```
;
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
    @   	IN  	A           	10.64.3.2
    @   	IN  	AAAA        	::1
    www 	IN  	CNAME   panah.salopati.it01.com.
    log 	IN  	A           	10.64.3.2
    www.log IN  	CNAME   log.panah.salopati.it01.com.
```
## No.11
### Step
Check seluruh server, dan Di setiap client yang berada di luar Majapahit, konfigurasikan file /etc/resolv.conf untuk menambahkan DNS Majapahit sebagai server DNS utama. Setelah itu Tambahkan alamat IP dari DNS Server Majapahit (10.64.3.2.). Setelah itu Pada DNS Server Majapahit, pastikan konfigurasi forwarding DNS ke server DNS luar sudah diaktifkan [forwarders { 8.8.8.8; # Google DNS sebagai contoh 8.8.4.4; };]. Last di ping

![config forwarding dns](https://github.com/user-attachments/assets/933c9e47-03e6-401c-a104-336e936219d6)

![hasil ping](https://github.com/user-attachments/assets/edc64625-8f84-4915-a6cf-0c99a85c25bd)


![root](https://github.com/user-attachments/assets/dae698cf-9adb-4fa3-96c5-1dbd684ee25b)
