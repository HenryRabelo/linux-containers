FROM ubuntu
LABEL name="Ubuntu Coding Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# Enable APT SecComp Sandbox
 RUN echo 'APT::Sandbox::Seccomp "true";' > '/etc/apt/apt.conf.d/40sandbox' &&\
# System update & upgrade
  apt-get update  &&  apt-get full-upgrade -y &&\
# Install core utils
  apt-get install -y opendoas nano curl &&\
# Blank Dockerfile, locally edited to install packages for the current project.
#  apt-get install -y &&\
# Configure work directory
  chown ubuntu "/home/shared"

CMD ["/bin/bash"]
