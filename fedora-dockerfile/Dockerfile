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
  dnf install -y vim-default-editor zsh zsh-autosuggestions zsh-syntax-highlighting wget2 &&\
# Setup OS preferences
  wget --https-only --no-hsts -O "$HOME/.zshrc" "https://gitlab.com/kalilinux/packages/kali-defaults/-/raw/kali/master/etc/skel/.zshrc" &&\
  wget --https-only --no-hsts -O "$HOME/.zprofile" "https://src.fedoraproject.org/rpms/zsh/raw/rawhide/f/dotzprofile" &&\
  echo -e '\nPROMPT="[%F{%(!.red.cyan)}%n@%m%F{reset} %(5~.%-2~/…/%1~.%4~)]%# "' >> "$HOME/.zshrc" &&\
# Create user account
  useradd --create-home --shell "/bin/zsh" fedora &&\
  cp "$HOME/.z*" "/home/fedora" &&\
  chown fedora "/home/fedora/.z*" &&\
  chown fedora "/home/shared"

CMD ["/bin/zsh"]
