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
# Install testing tools
  && apt-get install -y metasploit-framework nmap hydra john hashcat hash-identifier gobuster aircrack-ng crackmapexec exiftool winexe \
# Install testing scanners
  && apt-get install -y sslscan sslyze ssldump wpscan sqlmap smbmap smbclient openvas-scanner amass arp-scan \
# Install management platforms
  && apt-get install -y defectdojo gvmd bloodhound \
# Create user account
  && useradd --create-home --shell "/bin/zsh" kali && chown kali "/home/shared"

CMD "/bin/zsh"
