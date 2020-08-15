FROM openjdk:11.0.8-jre

WORKDIR /home

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://download2.interactivebrokers.com/portal/clientportal.gw.zip

RUN unzip ./clientportal.gw.zip -d clientportal

WORKDIR /home/clientportal

COPY ./conf.yaml root/

CMD ["bin/run.sh", "root/conf.yaml"]

EXPOSE 5000 5000