# SSL
Script for creating and signing SSL certs

# USAGE
1. cp openssl-tpl.cnf openssl.cnf
2. touch index.txt
3. mkdir certs
4. mkdir ca
5. mkdir newcerts
6. ./GENERATE.sh

# Config Description (gen.cfg)
rca_days=  - RCA/CA validity (days)
rca_subj=  - RCA/CA certificate subject
cert_subj= - Certificates subject 
rca_len=   - RCA/CA key size
rca_root=  - RCA/CA folder
cert_root= - Certificates folder
cert_validity= - Certificate validity (years)
sig_ca_choosen= - Default RCA/CA for sign
domain= - RCA/CA and certificates domain prefix
ca_tpl= - RCA/CA domain prefix
p12pass= - p12 default password
