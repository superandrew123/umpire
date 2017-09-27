# open ssh connection to EC2 instance

touch ./fohr_andrew.pem
chmod 777 ./fohr_andrew.pem
echo "-----BEGIN RSA PRIVATE KEY-----" >> $1/fohr_andrew.pem
cat $REDIS_ARM >> $1/fohr_andrew.pem
echo "" >> $1/fohr_andrew.pem
echo "-----END RSA PRIVATE KEY-----" >> $1/fohr_andrew.pem
echo "SSH set-up complete 👍 🤘 👌"

ssh -o "StrictHostKeyChecking=no" -L 6379:fohr-andrew-test-2.dpdkrj.0001.use1.cache.amazonaws.com:6379 -i ./fohr_andrew.pem ubuntu@ec2-54-235-5-112.compute-1.amazonaws.com
echo "<---- SSHed ---->"