FROM ubuntu:16.04

MAINTAINER Tino Kiviharju <tino.kiviharju@gmail.com>

ENV USER=root DEBIAN_FRONTEND=noninteractive


RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get install -y python-software-properties software-properties-common apt-transport-https aptitude curl zsh git

RUN add-apt-repository ppa:jonathonf/vim
RUN add-apt-repository ppa:jonathonf/vim
RUN apt-get update

RUN apt-get install -y exuberant-ctags python

RUN apt-get install -y golang-1.9-go vim

RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone https://github.com/tkharju/vim.git /root/.vim
RUN curl https://raw.githubusercontent.com/tkharju/zsh/master/zshrc > /root/.zshrc 

CMD /bin/zsh

