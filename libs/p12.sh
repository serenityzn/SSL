function p12 {
openssl pkcs12 -name $cert_root/${1} -export -out $cert_root/${1}.p12 -inkey $cert_root/${1}.KEY.pem -in $cert_root/${1}.CRT.pem -passout pass:$p12pass
}
