function create_openssl_config {
 dir='$dir'
cat <<EOF >> openssl.cnf
[$1-$ca_tpl]
dir             = ./
database        = $dir/index.txt
new_certs_dir   = $dir/newcerts
certificate     = $dir/ca/$1-$ca_tpl.crt
serial          = $dir/serial
private_key     = $dir/ca/$1-$ca_tpl.key
x509_extensions = usr_cert
#name_opt        = ca_default
#cert_opt        = ca_default
default_md      = sha256
policy          = policy_match
EOF

}
