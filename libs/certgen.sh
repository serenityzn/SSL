function generate_clients {
run="openssl req -new -nodes -newkey rsa:2048 -keyout $cert_root/$1$domain.KEY.pem -out $cert_root/$1$domain.CSR.pem -subj '$cert_subj$1'"
eval $run
}
