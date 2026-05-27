sudo reboot
ip a
sudo rm -r /etc/machine-id 
sudo dbus-uuidgen --ensure=/etc/machine-id
sudo reboot
clear
Q
su --
su -
passwd
 -
cd ~/kel-5
docker ps
docker compose up -d
sudo apt install bind9 bind9-utils -y
sudo nano /etc/bind/named.conf.local
sudo cp /etc/bind/db.local /etc/bind/db.kelima.com
sudo nano /etc/bind/db.kelima.com
cd ~/kel-5
docker compose up -d
sudo nano /etc/bind/db.kelima.com
cd ~/kel-5
docker compose up -d
sudo systemctl restart bind9
sudo systemctl status bind9
docker ps
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 53
sudo ufw enable
sudo ufw status verbose
ssh-keygen
cat ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
sudo systemctl restart ssh
sudo systemctl status ssh
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl status ssh
ss -tulpn | grep :22
sudo ufw status
sudo ufw allow 22/tcp
sudo ufw status
sudo nano /etc/fail2ban/jail.local
sudo systemctl restart fail2ban
sudo fail2ban-client status
docker ps
docker network ls
ss -tulpn
curl -k https://localhost
sudo fail2ban-client status
dig kelima.com
docker exec -it wordpress bash
docker ps
cd ~/kel-5
docker compose up -d
docker ps
apt update
sudo apt update
sudo apt upgrade -y
ls
ip a
sudo apt install -y curl wget git unzip vim net-tools ca-certificates gnupg lsb-release ufw fail2ban
ip a
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER
docker --version
docker compose version
mkdir -p ~/kel-5
nano .env
mkdir -p nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx/ssl/selfsigned.key -out nginx/ssl/selfsigned.crt
mkdir -p nginx/conf.d
nano nginx/conf.d/default.conf
nano docker-compose.yml
docker compose up -d
docker ps
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl restart bind9
dig wordpress.local
sudo nano /etc/bind/db.kelima.com
sudo nano /etc/bind/named.conf.local
sudo nano /etc/bind/db.kelima.com
sudo systemctl restart bind9
dig kelima.com
sudo nano /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved
dig kelima.com
nslookup kelima.com
sudo named-checkconf
sudo named-checkzone kelima.com /etc/bind/db.kelima.com
sudo nano /etc/bind/db.kelima.com
sudo systemctl restart bind9
dig kelima.com
nslookup kelima.com
sudo ufw default deny incoming
sudo ufw default allow outgoing
dig kelima.com
cd ~/kel-5
ls
ls dir
cd ..
sudo docker ps
nano docker-compose.yml
mkdir -p docs
mkdir -p docker/nginx
mkdir -p docker/app
mkdir -p docker/db
mkdir -p scripts
ls
cd ~/kel-5
mkdir -p docs
mkdir -p docker/nginx
mkdir -p docker/app
mkdir -p docker/db
mkdir -p scripts
ls
cd docker
ls
cd ..
cp ~/docker-compose.yml ~/kel-5/docker/
ls
cd docker
ls
cp -r ~/nginx/* ~/kel-5/docker/nginx/
ls
cd ..
nano ~/kel-5/scripts/setup.sh
nano ~/kel-5/scripts/backup.sh
chmod +x ~/kel-5/scripts/backup.sh
chmod +x ~/kel-5/scripts/setup.sh
nano ~/kel-5/README.md
nano ~/kel-5/.env.example
git init
git remote add origin https://github.com/Dolly-021/kel-5-ksj.git
git remote -v
git add .
git commit -m "Initial project structure"
git add .
git commit -m "Initial project structure"
git config --global user.name "Dolly"
git config --global user.email "efredibukitdolly@gmail.com"
git config --global --list
git add .
git commit -m "Initial project structure"
git branch -M main
git push -u origin main
git remote -v
docker exec -it wordpress bash
ls
sudo nano /etc/bind/named.conf.options
sudo systemctl restart bind9
sudo ufw allow 53
sudo ufw status
git --version
git clone https://github.com/Dolly-021/kel-5-ksj.git
cd kel-5-ksj
ls
code .
docker ps
docker network ls
sudo su
