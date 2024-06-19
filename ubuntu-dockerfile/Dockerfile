# [Ubuntu Dockerfile]
FROM ubuntu
LABEL name="Ubuntu Coding Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# System upgrade
 RUN apt-get update  &&  apt-get full-upgrade -y \
# Blank Dockerfile, locally edited to install packages for the current project.
  && apt-get update \
# Create user account
  && useradd --create-home --shell "/bin/bash" ubuntu && chown ubuntu "/home/shared"

CMD "/bin/bash"
