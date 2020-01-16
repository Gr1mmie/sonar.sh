sonar () { 
url=$1

curl https://tls.bufferover.run/dns?q=$url | jq >> sonar_output.txt

cat sonar_output.txt | jq '.Results' | gron | awk -v RS='([0-9]+\\.){3}[0-9]+' 'RT{print RT}'| tee -a sonar_IPs_$url.txt
}

sonar $1
