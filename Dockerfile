# Initialize a docker file with node:18 image
FROM ubuntu:latest

# Setup git
RUN apt-get update && apt-get install -y git

# Setup ssh client
RUN apt-get install -y openssh-client

EXPOSE 22
EXPOSE 443
EXPOSE 80

RUN mkdir -m 700 /root/.ssh
RUN touch -m 600 /root/.ssh/known_hosts
RUN ssh-keyscan github.com > /root/.ssh/known_hosts

RUN echo "Hello World"

CMD ["bash"]

# Clone the repository
RUN git clone git@github.com:kshehadeh/sandbox.git


