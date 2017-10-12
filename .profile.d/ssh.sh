# open ssh connection to EC2 instance

touch fohr_andrew.pem
echo "       Creating pem"
echo "-----BEGIN RSA PRIVATE KEY-----" >> fohr_andrew.pem
echo $REDIS_ARM
echo $REDIS_ARM >> fohr_andrew.pem
# echo "" >> fohr_andrew.pem
echo "-----END RSA PRIVATE KEY-----" >> fohr_andrew.pem
echo "       Created pem"




ssh -o "StrictHostKeyChecking no" -f -N -L $REDIS_PORT_INFO -i ~/fohr_andrew.pem $EC2_REDIS_BRIDGE
