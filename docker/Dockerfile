FROM python:3.8-slim

LABEL maintainer="Ale Name mail@here.com"

WORKDIR /opt/app

RUN rm -f /etc/apt/apt.conf

COPY apt.conf /etc/apt
COPY requirements.txt /tmp
COPY test /test

RUN apt -y update \
    && apt install wget -y \
    && apt -y install gcc curl telnet wget vim iproute2 tcpdump tzdata iptables \
    && ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime \
    && pip3 install --no-cache-dir --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org -r /tmp/requirements.txt \
    && apt -y remove gcc \
    && apt -y autoremove \
    && apt clean all

COPY app.py /opt/app
RUN useradd -c "app user" -d /opt/app -s /bin/sh app -u 9999 -U -M \
    && chown -R app:app /opt/app
USER app

EXPOSE 5000 8000

CMD ["python3", "/opt/app/app.py"]
