FROM kalilinux/kali-rolling
LABEL name="Kali Testing Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# Enable APT SecComp Sandbox
 RUN echo 'APT::Sandbox::Seccomp "true";' > '/etc/apt/apt.conf.d/40sandbox' &&\
# System update & upgrade
  apt-get update  &&  apt-get full-upgrade -y &&\
# Install core system
  apt-get install -y kali-system-cli kali-system-core kali-linux-core kali-defaults &&\
# Install wordlists & misc.
  apt-get install -y wordlists seclists dirbuster screenfetch cmatrix &&\
# Install core utils
  apt-get install -y iputils-ping wget curl vim sudo rlwrap whois 7zip gzip &&\
# Install testing tools
  apt-get install -y metasploit-framework nmap hydra john hashcat hashid gobuster adb aircrack-ng crackmapexec exiftool winexe &&\
# Install testing scanners
  apt-get install -y sslscan sslyze ssldump wpscan sqlmap smbmap smbclient openvas-scanner amass arp-scan &&\
# Install management platforms
  apt-get install -y defectdojo spiderfoot &&\
# Setup OS preferences
  gzip -d "/usr/share/wordlists/rockyou.txt.gz" &&\
  ln -s "/usr/share/wordlists" "/opt/" &&\
  ln -s "/usr/share/seclists" "/opt/" &&\
  ln -s "/usr/share/nmap" "/opt/" &&\
# Create user account
  useradd --shell "/bin/zsh" --groups sudo --create-home kali &&\
  chown kali "/home/shared"

CMD ["/bin/zsh"]
