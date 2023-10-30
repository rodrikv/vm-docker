FROM docker:latest

COPY . .

RUN apk add poetry python3 npm git py3-pip

RUN git clone https://github.com/rodrikv/shell-bot.git

WORKDIR /shell-bot

RUN python3 -m pip install -r requirements.txt

CMD ["python3", "bot.py"]