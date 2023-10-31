FROM docker:dind

RUN mkdir -p ~/.ssh \
    && chmod 0700 ~/.ssh \
    && apk add openssh \
    && ssh-keygen -A

RUN apk add poetry python3 npm git py3-pip

RUN git clone https://github.com/rodrikv/shell-bot.git

WORKDIR /shell-bot

RUN python3 -m pip install -r requirements.txt

COPY . .
CMD ["sh", "entrypoint.sh"]
