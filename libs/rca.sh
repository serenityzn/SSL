function rootca { #input argument $1 - name of the service. Example: china-demo.
carun="openssl req -nodes -new -sha256 -x509 -sha256 -newkey rsa:$rca_len -keyout $rca_root/$1-$ca_tpl.key -out $rca_root/$1-$ca_tpl.crt -days $rca_days -subj '$rca_subj'"
eval $carun

create_openssl_config $1
}
