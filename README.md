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



## No.11
### Step
Check seluruh server, dan Di setiap client yang berada di luar Majapahit, konfigurasikan file /etc/resolv.conf untuk menambahkan DNS Majapahit sebagai server DNS utama. Setelah itu Tambahkan alamat IP dari DNS Server Majapahit (10.64.3.2.). Setelah itu Pada DNS Server Majapahit, pastikan konfigurasi forwarding DNS ke server DNS luar sudah diaktifkan [forwarders { 8.8.8.8; # Google DNS sebagai contoh 8.8.4.4; };]. Last di ping

![config forwarding dns](https://github.com/user-attachments/assets/933c9e47-03e6-401c-a104-336e936219d6)

![hasil ping](https://github.com/user-attachments/assets/edc64625-8f84-4915-a6cf-0c99a85c25bd)


![root](https://github.com/user-attachments/assets/dae698cf-9adb-4fa3-96c5-1dbd684ee25b)
