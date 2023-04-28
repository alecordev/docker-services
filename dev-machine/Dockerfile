FROM ubuntu:latest

# Install SSH and Git
RUN apt-get update && \
    apt-get install -y ssh git

# Set up SSH
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
EXPOSE 22

# Set up volume for home directory
VOLUME /root

CMD ["/usr/sbin/sshd", "-D"]
