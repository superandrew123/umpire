# open ssh connection to EC2 instance

# ssh -o "StrictHostKeyChecking no" -f -N -L $REDIS_PORT_INFO -i ~/fohr_andrew.pem $EC2_REDIS_BRIDGE