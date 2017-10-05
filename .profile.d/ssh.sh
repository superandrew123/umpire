# open ssh connection to EC2 instance

touch ./fohr_andrew.pem

# echo "" >> ./fohr_andrew.pem
cat <<EOF > ./fohr_andrew.pem
-----BEGIN RSA PRIVATE KEY-----
$REDIS_ARM
-----END RSA PRIVATE KEY-----
EOF
echo "SSH set-up complete 👍 🤘 👌"



# ssh -nNT -o "StrictHostKeyChecking=no" -L 6379:fohr-andrew-test-2.dpdkrj.0001.use1.cache.amazonaws.com:6379 -i ./fohr_andrew.pem ubuntu@ec2-54-235-5-112.compute-1.amazonaws.com
echo "<---- SSHed ---->"
