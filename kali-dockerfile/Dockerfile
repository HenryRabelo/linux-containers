# [Kali Dockerfile]
FROM kalilinux/kali-rolling
LABEL name="Kali Testing Environment" created-by="Henry Rabelo"
VOLUME "/home/shared"
WORKDIR "/home/shared"

# System upgrade
 RUN apt-get update  &&  apt-get full-upgrade -y \
# Install core system
  && apt-get install -y kali-system-cli kali-system-core kali-linux-core kali-defaults \
# Install wordlists & misc.
  && apt-get install -y wordlists seclists dirbuster \
# Install core utils
  && apt-get install -y iputils-ping curl nano whois 7zip \
# Install testing utils
  && apt-get install -y metasploit-framework sslscan sslyze ssldump nmap hydra john hashcat hash-identifier gobuster wpscan sqlmap smbmap smbclient openvas-scanner amass crackmapexec arp-scan aircrack-ng exiftool winexe \
# Create user account
  && useradd --create-home --shell "/bin/zsh" kali && chown kali "/home/shared"

CMD "/bin/zsh"
