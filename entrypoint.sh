echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo 'Port '$ssh_port >> /etc/ssh/sshd_config
echo $ssh_pub_key >> ~/.ssh/authorized_keys
/usr/sbin/sshd -D &
python3 bot.py