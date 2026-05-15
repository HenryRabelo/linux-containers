FROM ubuntu
LABEL name="Ubuntu Coding Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# Enable APT SecComp Sandbox
 RUN echo 'APT::Sandbox::Seccomp "true";' > '/etc/apt/apt.conf.d/40sandbox' &&\
# System update & upgrade
  apt-get update  &&  apt-get full-upgrade -y &&\
# Install core APT utils
  apt-get install -y dialog apt-utils apt-transport-https &&\
# Install core utils
  apt-get install -y zsh nano curl less man-db &&\
# Install plugins
  apt-get install -y zsh-autosuggestions zsh-syntax-highlighting &&\
# Blank space, edit to install packages relevant for the current project.
#  apt-get install -y &&\
# Setup OS preferences
  curl --output "/root/.zshrc" "https://gitlab.com/kalilinux/packages/kali-defaults/-/raw/kali/master/etc/skel/.zshrc" &&\
  curl --output "/root/.zprofile" "https://src.fedoraproject.org/rpms/zsh/raw/rawhide/f/dotzprofile" &&\
  echo -e '\nPROMPT="${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(!.red.green)}%n@%m%b%F{%(!.green.cyan)}-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(!.green.cyan)}]%F{reset}%# "' >> "/root/.zshrc" &&\
# Configure work directory
  usermod --shell "/bin/zsh" ubuntu &&\
  passwd --delete --expire ubuntu &&\
  cp /root/.z* /home/ubuntu/ &&\
  chown ubuntu /home/ubuntu/.z* &&\
  chown ubuntu "/home/shared" &&\
  usermod --shell "/sbin/nologin" --lock root

CMD ["/bin/zsh"]
