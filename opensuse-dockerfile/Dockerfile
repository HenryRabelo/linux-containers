FROM opensuse/tumbleweed
LABEL name="openSUSE Coding Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# System upgrade
 RUN zypper dist-upgrade -y &&\
# Install core utils.
  zypper install -y sudo nano zsh curl &&\
# Install misc.
  zypper install -y man system-group-wheel sudo-policy-wheel-auth-self &&\
# Setup OS preferences
  curl --output "/root/.zshrc" "https://gitlab.com/kalilinux/packages/kali-defaults/-/raw/kali/master/etc/skel/.zshrc" &&\
  curl --output "/root/.zprofile" "https://src.fedoraproject.org/rpms/zsh/raw/rawhide/f/dotzprofile" &&\
  echo -e '\nPROMPT="%F{%(!.red.green)}%n@%m%F{%(!.green.cyan)}[%F{reset}%(5~.%-2~/…/%1~.%4~)%F{%(!.green.cyan)}]%F{reset}%(!.#.>)"' >> "/root/.zshrc" &&\
# Setup user account
  useradd --shell "/bin/zsh" --groups wheel --create-home opensuse &&\
  passwd --delete --expire opensuse &&\
  rmdir "/home/opensuse/bin" &&\
  cp /root/.z* /home/opensuse/ &&\
  chown opensuse /home/opensuse/.z* &&\
  chown opensuse "/home/shared" &&\
# Lock root account
  usermod --shell "/sbin/nologin" --lock root

CMD ["/bin/zsh"]
