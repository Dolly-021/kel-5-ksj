# Kelompok 5 - Topik A

## Dosen Pengampu
Dosen Pengampu : Ainul Hizriadi S.Kom., M.Sc

## Anggota Kelompok

- Cindy Samosir — 241402009  
- Cindy Artika — 241402012  
- Earlin Tasia Gulo — 241402089  
- Dolly Efredi Bukit — 241402021  
- Chaterine Eklesia Maryati — 241402123  
- Rohaya Hasibuan — 241402030  

## Program Studi

Teknologi Informasi  
Fakultas Ilmu Komputer & Teknologi Informasi  
Universitas Sumatera Utara  

---

## Arsitektur Sistem

Proyek ini menggunakan beberapa layanan dan teknologi berikut:

- Nginx Reverse Proxy
- WordPress Container
- MariaDB Container
- Bind9 DNS Server
- UFW Firewall
- Fail2Ban
- HTTPS SSL/TLS

---

## Cara Menjalankan Project

Jalankan perintah berikut:

```bash
docker compose up -d
```
---

## Domain

Project ini menggunakan domain:

[kelima.com](https://kelima.com)

---

## IP Adress
```bash
172.30.67.107/19
```

### Paduan Installasi lengkap

Tahap 1 Install Docker

Update sistem:

sudo apt update
sudo apt upgrade -y

Install Docker:

curl -fsSL https://get.docker.com | sudo sh

Tambahkan user:

sudo usermod -aG docker $USER

Logout lalu login kembali.

Verifikasi:

docker --version
docker compose version
Tahap 2 Struktur Folder

Buat direktori proyek:

mkdir ~/wordpress-secure
cd ~/wordpress-secure

Struktur:

wordpress-secure/
│
├── nginx/
│   ├── conf.d/
│   └── ssl/
│
├── wordpress/
│
├── mariadb/
│
├── .env
│
└── docker-compose.yml
Tahap 3 File Environment

Buat:

nano .env

Isi:

MYSQL_ROOT_PASSWORD=root123456

MYSQL_DATABASE=wordpressdb

MYSQL_USER=wpuser

MYSQL_PASSWORD=wppassword123
Tahap 4 Generate SSL

Buat folder:

mkdir -p nginx/ssl

Generate sertifikat:

openssl req -x509 \
-nodes \
-days 365 \
-newkey rsa:2048 \
-keyout nginx/ssl/selfsigned.key \
-out nginx/ssl/selfsigned.crt

Isi informasi sesuai kebutuhan.

Tahap 5 Konfigurasi Nginx Reverse Proxy

Buat folder:

mkdir -p nginx/conf.d

File:

nano nginx/conf.d/default.conf

Isi:

server {
    listen 80;
    server_name _;

    return 301 https://$host$request_uri;
}

server {

    listen 443 ssl;

    server_name _;

    ssl_certificate /etc/nginx/ssl/selfsigned.crt;
    ssl_certificate_key /etc/nginx/ssl/selfsigned.key;

    ssl_protocols TLSv1.2 TLSv1.3;

    location / {

        proxy_pass http://wordpress:80;

        proxy_set_header Host $host;

        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_set_header X-Forwarded-Proto https;

        proxy_set_header X-Real-IP $remote_addr;
    }
}

Konfigurasi ini:

✅ redirect HTTP → HTTPS

✅ SSL/TLS aktif

✅ reverse proxy ke WordPress

Tahap 6 Docker Compose

Buat:

nano docker-compose.yml

Isi:

services:

  nginx:

    image: nginx:latest

    container_name: nginx-proxy

    restart: always

    ports:
      - "80:80"
      - "443:443"

    volumes:
      - ./nginx/conf.d:/etc/nginx/conf.d
      - ./nginx/ssl:/etc/nginx/ssl

    depends_on:
      - wordpress

    networks:
      - frontend
      - backend

  wordpress:

    image: wordpress:latest

    container_name: 

    restart: always

    environment:

      WORDPRESS_DB_HOST: 

      WORDPRESS_DB_USER: 

      WORDPRESS_DB_PASSWORD:

      WORDPRESS_DB_NAME: 

    volumes:
      - wordpress_data:/var/www/html

    networks:
      - backend

  mariadb:

    image: mariadb:11

    container_name: mariadb

    restart: always

    env_file:
      - .env

    volumes:
      - mariadb_data:/var/lib/mysql

    expose:
      - "3306"

    networks:
      - backend

volumes:

  wordpress_data:

  mariadb_data:

networks:

  frontend:

    driver: bridge

  backend:

    driver: bridge

Perhatikan:

❌ Tidak ada:

ports:
  - "3306:3306"

Artinya database tidak bisa diakses dari luar host dan memenuhi syarat keamanan pada tugas.

Tahap 7 Menjalankan Container

Build:

docker compose up -d

Cek:

docker ps

Harus muncul:

nginx-proxy
wordpress
mariadb
Tahap 8 Instalasi WordPress

Buka browser:

https://IP_VM

Contoh:

https://192.168.56.10

Karena sertifikat self-signed:

Advanced
Proceed

Lanjutkan wizard WordPress:

Site Title
Username Admin
Password
Email

Install.

Tahap 9 DNS Server (Bind9)

Install:

sudo apt install bind9 bind9-utils -y

Edit:

sudo nano /etc/bind/named.conf.local

Tambahkan:

zone "wordpress.local" {

    type master;

    file "/etc/bind/db.wordpress.local";
};

Copy template:

sudo cp /etc/bind/db.local /etc/bind/db.wordpress.local

Edit:

sudo nano /etc/bind/db.wordpress.local

Isi:

$TTL 604800

@ IN SOA ns.wordpress.local. root.wordpress.local. (
2
604800
86400
2419200
604800
)

@ IN NS ns.wordpress.local.

@ IN A 192.168.56.10

ns IN A 192.168.56.10

www IN A 192.168.56.10

Restart:

sudo systemctl restart bind9

Test:

dig wordpress.local
Tahap 10 UFW Firewall

Default policy:

sudo ufw default deny incoming
sudo ufw default allow outgoing

Allow service penting:

sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 53

Aktifkan:

sudo ufw enable

Verifikasi:

sudo ufw status verbose
Tahap 11 SSH Hardening

Buat key pair dari komputer host:

ssh-keygen

Salin public key ke VM:

mkdir -p ~/.ssh

nano ~/.ssh/authorized_keys

Paste key.

Permission:

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

Edit SSH:

sudo nano /etc/ssh/sshd_config

Ubah:

PermitRootLogin no

PasswordAuthentication no

PubkeyAuthentication yes

Restart:

sudo systemctl restart ssh
Tahap 12 Fail2Ban

Buat:

sudo nano /etc/fail2ban/jail.local

Isi:

[sshd]

enabled = true

port = 22

maxretry = 3

findtime = 10m

bantime = 1h

Restart:

sudo systemctl restart fail2ban

Cek:

sudo fail2ban-client status
