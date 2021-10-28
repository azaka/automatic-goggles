FROM ubuntu
RUN apt update && apt install sudo git nano wget curl openssh-server -y
RUN useradd -m bob && adduser bob sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN useradd -m sam && adduser sam sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo 'sam:sam' |chpasswd
RUN chsh -s /bin/bash username

USER sam
# USER has no effect on WORKDIR... explicitly set this
WORKDIR /home/sam
