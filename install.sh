apt update
apt -yy install wget tar make gcc pwgen
wget https://www.softether-download.com/files/softether/v4.42-9798-rtm-2023.06.30-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.42-9798-rtm-2023.06.30-linux-x64-64bit.tar.gz
mkdir /opt/vpnserver
tar zxvf softether-vpnserver-v*.tar.gz -C /opt/vpnserver --strip-components 1
cd /opt/vpnserver/
make
wget -O /etc/systemd/system/vpnserver.service https://raw.githubusercontent.com/SemAnton2007/softether-install/main/vpnserver.service
systemctl daemon-reload
systemctl enable vpnserver --now
PASSWORD=`pwgen -c 20`
PASSWORD-USER=`pwgen -c 20`
/opt/vpnserver/vpncmd /SERVER 127.0.0.1:443 /HUB /CMD ServerPasswordSet $PASSWORD
/opt/vpnserver/vpncmd /SERVER 127.0.0.1:443 /HUB:default /CMD SecureNatEnable
/opt/vpnserver/vpncmd /SERVER 127.0.0.1:443 /HUB:default /CMD NatEnable
/opt/vpnserver/vpncmd /SERVER 127.0.0.1:443 /HUB:default /CMD DHCPEnable

/opt/vpnserver/vpncmd /SERVER 127.0.0.1:443 /HUB:default /CMD UserCreate user /GROUP:none /REALNAME:none /NOTE:none
/opt/vpnserver/vpncmd /SERVER 127.0.0.1:443 /HUB:default /CMD UserPasswordSet user /PASSWORD:$PASSWORD-USER

echo "Admin Password - $PASSWORD"
echo "User Password - $PASSWORD-USER"
