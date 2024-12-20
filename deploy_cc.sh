export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export PEER0_VAUTHORITY1_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority1.example.com/peers/peer0.vauthority1.example.com/tls/ca.crt
export PEER0_vauthority2_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority2.example.com/peers/peer0.vauthority2.example.com/tls/ca.crt
export PEER0_vauthority3_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority3.example.com/peers/peer0.vauthority3.example.com/tls/ca.crt
# export PEER0_voter_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/voter.example.com/peers/peer0.voter.example.com/tls/ca.crt
# export PEER0_vcms_CA=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vcms.example.com/peers/peer0.vcms.example.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/artifacts/channel/config/

export CHANNEL_NAME=mychannel

# set -x

setGlobalsForOrderer(){
    export CORE_PEER_LOCALMSPID="OrdererMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp
    
}

setGlobalsForPeer0vauthority1(){
    export CORE_PEER_LOCALMSPID="vauthority1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_VAUTHORITY1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority1.example.com/users/Admin@vauthority1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer1vauthority1(){
    export CORE_PEER_LOCALMSPID="vauthority1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_VAUTHORITY1_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority1.example.com/users/Admin@vauthority1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:8051
    
}

setGlobalsForPeer0vauthority2(){
    export CORE_PEER_LOCALMSPID="vauthority2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_vauthority2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority2.example.com/users/Admin@vauthority2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:9051
    
}

setGlobalsForPeer1vauthority2(){
    export CORE_PEER_LOCALMSPID="vauthority2MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_vauthority2_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority2.example.com/users/Admin@vauthority2.example.com/msp
    export CORE_PEER_ADDRESS=localhost:10051
    
}

setGlobalsForPeer0vauthority3(){
    export CORE_PEER_LOCALMSPID="vauthority3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_vauthority3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority3.example.com/users/Admin@vauthority3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:11051
    
}

setGlobalsForPeer1vauthority3(){
    export CORE_PEER_LOCALMSPID="vauthority3MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_vauthority3_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vauthority3.example.com/users/Admin@vauthority3.example.com/msp
    export CORE_PEER_ADDRESS=localhost:12051
    
}

# setGlobalsForPeer0voter(){
#     export CORE_PEER_LOCALMSPID="voterMSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_voter_CA
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/voter.example.com/users/Admin@voter.example.com/msp
#     export CORE_PEER_ADDRESS=localhost:13051
    
# }

# setGlobalsForPeer1voter(){
#     export CORE_PEER_LOCALMSPID="voterMSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_voter_CA
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/voter.example.com/users/Admin@voter.example.com/msp
#     export CORE_PEER_ADDRESS=localhost:14051
    
# }

# setGlobalsForPeer0vcms(){
#     export CORE_PEER_LOCALMSPID="vcmsMSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_vcms_CA
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vcms.example.com/users/Admin@vcms.example.com/msp
#     export CORE_PEER_ADDRESS=localhost:15051
    
# }

# setGlobalsForPeer1vcms(){
#     export CORE_PEER_LOCALMSPID="vcmsMSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_vcms_CA
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/vcms.example.com/users/Admin@vcms.example.com/msp
#     export CORE_PEER_ADDRESS=localhost:16051
    
# }

presetup() {
    echo Vendoring Go dependencies ...
    pushd ./artifacts/src/github.com/fabcar/go
    # go mod init github.com/satyam-thakur/voting-network
    # go mod tidy
    GO111MODULE=on go mod vendor
    popd
    echo Finished vendoring Go dependencies
}
# presetup

CHANNEL_NAME="mychannel"
CC_RUNTIME_LANGUAGE="golang"
VERSION="1"
CC_SRC_PATH="./artifacts/src/github.com/chaincode/Ballot1"
CC_NAME="voting"

packageChaincode() {
    # rm -rf ${CC_NAME}.tar.gz
    setGlobalsForPeer0vauthority1
    peer lifecycle chaincode package ${CC_NAME}.tar.gz \
        --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} \
        --label ${CC_NAME}_${VERSION}
    echo "===================== Chaincode is packaged on ===================== "
}
# packageChaincode

installChaincode() {
    setGlobalsForPeer0vauthority1
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.vauthority1 ===================== "

    # setGlobalsForPeer1vauthority1
    # peer lifecycle chaincode install ${CC_NAME}.tar.gz
    # echo "===================== Chaincode is installed on peer1.vauthority1 ===================== "

    setGlobalsForPeer0vauthority2
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org2 ===================== "

    # # setGlobalsForPeer1vauthority2
    # # peer lifecycle chaincode install ${CC_NAME}.tar.gz
    # # echo "===================== Chaincode is installed on peer1.org2 ===================== "
    
    setGlobalsForPeer0vauthority3
    peer lifecycle chaincode install ${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.org2 ===================== "

    # setGlobalsForPeer1vauthority3
    # peer lifecycle chaincode install ${CC_NAME}.tar.gz
    # echo "===================== Chaincode is installed on peer1.org2 ===================== "

    # setGlobalsForPeer0voter
    # peer lifecycle chaincode install ${CC_NAME}.tar.gz
    # echo "===================== Chaincode is installed on peer0.org2 ===================== "

    # setGlobalsForPeer1voter
    # peer lifecycle chaincode install ${CC_NAME}.tar.gz
    # echo "===================== Chaincode is installed on peer1.org2 ===================== "

    # setGlobalsForPeer0vcms
    # peer lifecycle chaincode install ${CC_NAME}.tar.gz
    # echo "===================== Chaincode is installed on peer0.org2 ===================== "

    # setGlobalsForPeer1vcms
    # peer lifecycle chaincode install ${CC_NAME}.tar.gz
    # echo "===================== Chaincode is installed on peer1.org2 ===================== "
}

# installChaincode

queryInstalled() {
    setGlobalsForPeer0vauthority1
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.vauthority1 on channel ===================== "
}

# queryInstalled

# --collections-config ./artifacts/private-data/collections_config.json \
#         --signature-policy "OR('vauthority1MSP.member','vauthority2MSP.member')" \
# --collections-config $PRIVATE_DATA_CONFIG \

approveForMyvauthority1() {
    setGlobalsForPeer0vauthority1
    set -x
    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        # --collections-config $PRIVATE_DATA_CONFIG \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name ${CC_NAME} --version ${VERSION} \
        --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}
        --signature-policy "OR('vauthority1MSP.member','vauthority2MSP.member')"
    set +x

    echo "===================== chaincode approved from org 1 ===================== "

}


getBlock() {
    setGlobalsForPeer0vauthority1
    # peer channel fetch 10 -c mychannel -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com --tls \
    #     --cafile $ORDERER_CA

    peer channel getinfo  -c mychannel -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls \
        --cafile $ORDERER_CA
}

# getBlock

# approveForMyvauthority1

# --signature-policy "OR ('vauthority1MSP.member')"
# --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_vauthority1_CA --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA
# --peerAddresses peer0.vauthority1.example.com:7051 --tlsRootCertFiles $PEER0_vauthority1_CA --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles $PEER0_ORG2_CA
#--channel-config-policy Channel/Application/Admins
# --signature-policy "OR ('vauthority1MSP.peer','Org2MSP.peer')"

checkCommitReadyness() {
    setGlobalsForPeer0vauthority1
    peer lifecycle chaincode checkcommitreadiness \
        --collections-config $PRIVATE_DATA_CONFIG \
        --channelID $CHANNEL_NAME --name ${CC_NAME} --version ${VERSION} \
        --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from org 1 ===================== "
}

# checkCommitReadyness

# --collections-config ./artifacts/private-data/collections_config.json \
# --signature-policy "OR('vauthority1MSP.member','Org2MSP.member')" \
approveForMyOrg2() {
    setGlobalsForPeer0Org2

    peer lifecycle chaincode approveformyorg -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --version ${VERSION} --init-required --package-id ${PACKAGE_ID} \
        --sequence ${VERSION}
        --signature-policy "OR('vauthority1MSP.member','vauthority2MSP.member')"

    echo "===================== chaincode approved from org 2 ===================== "
}

# approveForMyOrg2

checkCommitReadyness() {

    setGlobalsForPeer0vauthority1
    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_vauthority1_CA \
        --collections-config $PRIVATE_DATA_CONFIG \
        --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json --init-required
    echo "===================== checking commit readyness from org 1 ===================== "
}

# checkCommitReadyness

commitChaincodeDefination() {
    setGlobalsForPeer0vauthority1
    peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        --channelID $CHANNEL_NAME --name ${CC_NAME} \
        --collections-config $PRIVATE_DATA_CONFIG \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_vauthority1_CA \
        --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA \
        --version ${VERSION} --sequence ${VERSION} --init-required
        --signature-policy "OR('vauthority1MSP.member','vauthority2MSP.member')"

}

# commitChaincodeDefination

queryCommitted() {
    setGlobalsForPeer0vauthority1
    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME --name ${CC_NAME}

}

# queryCommitted

chaincodeInvokeInit() {
    setGlobalsForPeer0vauthority1
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
        -C $CHANNEL_NAME -n ${CC_NAME} \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_vauthority1_CA \
        --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA \
        --isInit -c '{"Args":[]}'

}

# chaincodeInvokeInit

chaincodeInvoke() {
    # setGlobalsForPeer0vauthority1
    # peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
    # --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME -n ${CC_NAME} \
    # --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_vauthority1_CA \
    # --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA  \
    # -c '{"function":"initLedger","Args":[]}'

    setGlobalsForPeer0vauthority1

    ## Create Car
    # peer chaincode invoke -o localhost:7050 \
    #     --ordererTLSHostnameOverride orderer.example.com \
    #     --tls $CORE_PEER_TLS_ENABLED \
    #     --cafile $ORDERER_CA \
    #     -C $CHANNEL_NAME -n ${CC_NAME}  \
    #     --peerAddresses localhost:7051 \
    #     --tlsRootCertFiles $PEER0_vauthority1_CA \
    #     --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA   \
    #     -c '{"function": "createCar","Args":["Car-ABCDEEE", "Audi", "R8", "Red", "Pavan"]}'

    ## Init ledger
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME -n ${CC_NAME} \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_vauthority1_CA \
        --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA \
        -c '{"function": "initLedger","Args":[]}'

    ## Add private data
    export CAR=$(echo -n "{\"key\":\"1111\", \"make\":\"Tesla\",\"model\":\"Tesla A1\",\"color\":\"White\",\"owner\":\"pavan\",\"price\":\"10000\"}" | base64 | tr -d \\n)
    peer chaincode invoke -o localhost:7050 \
        --ordererTLSHostnameOverride orderer.example.com \
        --tls $CORE_PEER_TLS_ENABLED \
        --cafile $ORDERER_CA \
        -C $CHANNEL_NAME -n ${CC_NAME} \
        --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_vauthority1_CA \
        --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA \
        -c '{"function": "createPrivateCar", "Args":[]}' \
        --transient "{\"car\":\"$CAR\"}"
}

# chaincodeInvoke

chaincodeQuery() {
    setGlobalsForPeer0Org2

    # Query all cars
    # peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"Args":["queryAllCars"]}'

    # Query Car by Id
    peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"function": "queryCar","Args":["CAR0"]}'
    #'{"Args":["GetSampleData","Key1"]}'

    # Query Private Car by Id
    # peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"function": "readPrivateCar","Args":["1111"]}'
    # peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"function": "readCarPrivateDetails","Args":["1111"]}'
}

# chaincodeQuery

# Run this function if you add any new dependency in chaincode
# presetup

# packageChaincode
# installChaincode
# queryInstalled
# approveForMyvauthority1
# checkCommitReadyness
# approveForMyOrg2
# checkCommitReadyness
# commitChaincodeDefination
# queryCommitted
# chaincodeInvokeInit
# sleep 5
# chaincodeInvoke
# sleep 3
# chaincodeQuery