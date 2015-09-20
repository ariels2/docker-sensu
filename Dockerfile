FROM ubuntu:trusty
MAINTAINER Julien Fabre <ju.pryz@gmail.com>

RUN apt-get update -y
RUN apt-get install -y supervisor wget

# Install RMQ
RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN apt-key add rabbitmq-signing-key-public.asc
RUN echo "deb     http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get update -y
RUN apt-get -y install erlang-nox rabbitmq-server

# Install Redis
RUN apt-get -y install redis-server

# Install Sensu
RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
RUN echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
RUN apt-get update -y
RUN apt-get -y install sensu

EXPOSE [5672, 4567, 6379]
