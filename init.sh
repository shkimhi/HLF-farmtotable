#도커 컨테이너 전체 삭제 
docker rm -f $(docker ps -aq)

#도커 CLI 에서 사용하지 않는 모든 볼륨을 제거
docker volume prune -y


#작업폴더 지정
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=${PWD}

#이미 생성된 채널 정보 및 인증서 삭제
rm -rf ./crypto-config/*
rm -rf ./channel-artifacts/*

#cryptogen 이용하여 인증서 생성
../bin/cryptogen generate --config=./crypto-config.yaml

#configtxgen 이용해 configtx.yaml 속 파일 읽어서 제네시스블록 생성
../bin/configtxgen -profile SampleMultiNodeEtcdRaft -channelID system-channel -outputBlock ./channel-artifacts/genesis.block

#configtxgen 이용하여 configtx.yaml 파일 읽어서 채널 정보 생성 (?)
../bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel1.tx -channelID channel1

# Org 1 ,2 의 앵커피어 업데이트.
../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID channel1 -asOrg Org1MSP
../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID channel1 -asOrg Org2MSP
