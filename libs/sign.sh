function sign {
 sca=$(echo $sig_ca_choosen|awk -F "." '{print $1}')
 echo "SCA==="$sca
 openssl rand -hex 12 > serial
 startdate=$(date +%Y%m%d)"000001Z"
 enddate=$(($(date +%Y)+$cert_validity))$(date +%m%d)"000001Z"
 openssl ca -batch -config openssl.cnf -name $sca -md sha256 -startdate $startdate -enddate $enddate -in $cert_root/$1$domain.CSR.pem -out $cert_root/$1$domain.CRT.pem
 echo "openssl ca -config openssl.cnf -name $sca -md sha256 -startdate $startdate -enddate $enddate -in $cert_root/$1$domain.CSR.pem -out $cert_root/$1$domain.CRT.pem"
 error_check $?
# rm -f $cert_root/$1$domain.CSR.pem
}
