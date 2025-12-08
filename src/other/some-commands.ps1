
# restart specific WSL distributions
wsl --terminate Ubuntu && wsl -d Ubuntu
wsl --terminate Debian && wsl -d Debian

# Connect to a site and print its certs, the copy-paste the pem data for self-signed certs
openssl s_client -connect example.com:443 -showcerts
