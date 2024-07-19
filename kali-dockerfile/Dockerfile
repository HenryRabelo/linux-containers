FROM kalilinux/kali-rolling
LABEL name="Kali Testing Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# Enable APT SecComp Sandbox
 RUN echo 'APT::Sandbox::Seccomp "true";' > '/etc/apt/apt.conf.d/40sandbox' &&\
# System update & upgrade
  apt-get update  &&  apt-get full-upgrade -y &&\
# Install core APT utils
  apt-get install -y dialog apt-utils apt-transport-https &&\
# Install core system
  apt-get install --no-install-recommends -y kali-system-core kali-linux-core &&\
# Install base system
  apt-get install -y kali-system-cli kali-defaults &&\
# Install core utils
  apt-get install -y iputils-ping wget curl vim sudo rlwrap whois 7zip gzip &&\
# Install wordlists & misc.
  apt-get install --no-install-recommends -y wordlists seclists screenfetch cmatrix &&\
# Context-dependant tools
#  apt-get install -y aircrack-ng &&\
# Install testing tools
  apt-get install -y hashid gobuster adb exiftool &&\
# Install recommend-heavy testing tools
  apt-get install --no-install-recommends -y metasploit-framework hydra hashcat john smbclient winexe &&\
# Install testing scanners
  apt-get install -y sslscan sslyze wpscan sqlmap smbmap amass &&\
# Install recommend-heavy testing scanners
  apt-get install --no-install-recommends -y nmap openvas-scanner ssldump arp-scan &&\
# Install management platforms
  apt-get install --no-install-recommends -y defectdojo spiderfoot &&\
# Setup OS preferences
  gzip -d "/usr/share/wordlists/rockyou.txt.gz" &&\
  ln -s "/usr/share/wordlists" "/opt/" &&\
  ln -s "/usr/share/seclists" "/opt/" &&\
  ln -s "/usr/share/nmap" "/opt/" &&\
  ln -s "/usr/share/metasploit-framework" "/opt/" &&\
# Create user account
  useradd --shell "/bin/zsh" --groups sudo --create-home kali &&\
  passwd --delete --expire kali &&\
  chown kali "/home/shared" &&\
  usermod --lock root

CMD ["/bin/zsh"]
