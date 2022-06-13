############################################################
# Dockerfile to build kitchen terraform
############################################################
FROM ruby:latest
# File Author / Maintainer
MAINTAINER Brian Carpio

ADD . /usr/src/app/
WORKDIR /usr/src/app/
RUN bundle install

RUN apt-get update
RUN apt install python3-pip postgresql-client -y
RUN pip3 install awscli --upgrade

RUN wget https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_linux_amd64.zip
RUN unzip terraform_1.2.2_linux_amd64.zip
RUN mv terraform /usr/local/bin
RUN chmod +x /usr/local/bin/terraform

ENTRYPOINT ["/usr/local/bin/terraform"]
