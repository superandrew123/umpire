# open ssh connection to EC2 instance

# ssh -o "StrictHostKeyChecking=no" -L 6379:fohr-andrew-test-2.dpdkrj.0001.use1.cache.amazonaws.com:6379 -i ./fohr_andrew.pem "UserKnownHostsFile=/dev/null" ubuntu@ec2-54-235-5-112.compute-1.amazonaws.com
echo $REDIS_ARM
echo "<---- SSHed ---->"