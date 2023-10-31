FROM docker:latest

RUN mkdir -p ~/.ssh \
    && chmod 0700 ~/.ssh \
    && echo "$ssh_pub_key" >> ~/.ssh/authorized_keys \
    && apk add openrc openssh \
    && ssh-keygen -A \
    && echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && mkdir -p /run/openrc \
    && touch /run/openrc/softlevel\
    && sed -i "s/^Port .*/Port ${ssh_port}/" /etc/ssh/sshd_config\
    && rc-service sshd start

RUN apk add poetry python3 npm git py3-pip

RUN git clone https://github.com/rodrikv/shell-bot.git

WORKDIR /shell-bot

RUN python3 -m pip install -r requirements.txt

CMD ["python3", "bot.py"]
