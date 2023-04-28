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

# Install Miniconda
ENV PATH="/root/miniconda/bin:${PATH}"
RUN apt-get install -y wget bzip2 && \
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    /bin/bash /tmp/miniconda.sh -b -p /root/miniconda && \
    rm /tmp/miniconda.sh

# Create Conda environment and install packages
COPY requirements.txt /tmp/requirements.txt
RUN conda update --all --yes && \
    conda create --name python310 --yes python=3.10 && \
    conda install --name python310 --yes --file /tmp/requirements.txt && \
    conda clean --all --yes && \
    echo "conda activate python310" >> ~/.bashrc

RUN /bin/bash -c "source activate python310 && mamba install --quiet --yes --file requirements.txt && conda clean --all -f -y"

CMD ["/usr/sbin/sshd", "-D"]
