FROM fedora
LABEL name="Fedora Coding Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# System upgrade
 RUN dnf upgrade -y &&\
# Install simpler escalation method
  dnf install -y opendoas &&\
# Protect opendoas package
  echo 'opendoas' > "/etc/dnf/protected.d/opendoas.conf" &&\
# Remove sudo package protection
  rm -f "/etc/dnf/protected.d/sudo.conf" &&\
# Remove sudo
  dnf remove --noautoremove -y sudo &&\
# Install core utils
  dnf install -y nano-default-editor zsh curl &&\
# Install plugins
  dnf install -y zsh-autosuggestions zsh-syntax-highlighting &&\
# Install misc.
  dnf install -y man cracklib-dicts &&\
# Setup OS preferences
  curl --output "/root/.zshrc" "https://gitlab.com/kalilinux/packages/kali-defaults/-/raw/kali/master/etc/skel/.zshrc" &&\
  curl --output "/root/.zprofile" "https://src.fedoraproject.org/rpms/zsh/raw/rawhide/f/dotzprofile" &&\
  echo -e '\nPROMPT="[%F{%(!.red.cyan)}%n@%m%F{reset} %(5~.%-2~/…/%1~.%4~)]%# "' >> "/root/.zshrc" &&\
  echo 'permit persist :wheel' >> "/etc/doas.conf" &&\
  chmod 600 "/etc/doas.conf" &&\
# Create user account
  useradd --shell "/bin/zsh" --groups wheel --create-home fedora &&\
  passwd --delete --expire fedora &&\
  cp /root/.z* /home/fedora/ &&\
  chown fedora /home/fedora/.z* &&\
  chown fedora "/home/shared" &&\
  usermod --shell "/sbin/nologin" --lock root

CMD ["/bin/zsh"]
