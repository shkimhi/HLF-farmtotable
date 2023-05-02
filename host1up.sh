#samples 폴더의 bin 폴더를 PATH환경변수에 추가함 . ( 올바른 버전에 Fabric 바이너리가 사용되도록 하기 위해서. )
export PATH=${PWD}/../bin:$PATH
#configtx.yaml 의 파일 경로를 FABRIC_CFG_PATH 로 설정함.
export FABRIC_CFG_PATH=${PWD}
#시스템 채널명을 channel1 로 저징함. 시스템 채널은 서비스 구성을 주문하는 데 사용되며 네트워크가 처음 시작될 때 생성됨.
export SYS_CHANNEL=channel1
#Docker 이미지 태그를를 최신으로 지정.
export IMAGE_TAG=latest
# host1.yaml 구성 파일을 사용하여 Docker Compose를 사용하여 Fabric 네트워크를 시작. -d 플래그는 백그라운드에서 컨테이너를 실행함(분리 모드).
docker-compose -f host1.yaml up -d
