export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=${PWD}

export SYS_CHANNEL=channel1
export IMAGE_TAG=latest

docker-compose -f host2.yaml up -d