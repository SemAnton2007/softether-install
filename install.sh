apt update
apt -yy install wget tar make gcc
wget https://www.softether-download.com/files/softether/v4.42-9798-rtm-2023.06.30-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz
mkdir /opt/vpnserver
tar zxvf softether-vpnserver-v*.tar.gz -C /opt/vpnserver --strip-components 1
cd /opt/vpnserver/
make
