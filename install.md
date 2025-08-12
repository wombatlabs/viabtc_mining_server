# 安装部署过程

- Ubuntu 20.04, 2 vCPU, 4G RAM,
- 先安装redis

## build

```sh
sudo apt update
sudo apt install -y libcurl4-openssl-dev libssl-dev libpsl-dev libnghttp2-dev libsodium-dev redis-server cmake zlib1g-dev libkrb5-dev libidn2-0-dev librtmp-dev libbrotli-dev libssh-dev libev-dev libjansson-dev libldap2-dev 

cd viabtc_mining_server/
cd depends/hiredis/
make
sudo make install
sudo ldconfig
cd ../../network/
make
cd ../utils
make
cd ../jobmaster
make
cd ../blockmaster
make
cd ../bitpeer
make
cd ../gateway
make
cd ../mineragent
make
cd ../poolbench
make
cd ../metawriter
make
cd ../metarelay
make
cd ../alertcenter
make
```

## 配置

- 矿池服务器的试运行，相关修改记录如下

### jobmaster 目录下的config.json

```json
    "flag": "debug" //日志级别为debug
    "main_coin": {
        "name": "FB",
        "host": "38.60.171.236",
        "port": 8332,
        "user": "fractalbitcoin",
        "pass": "fractalbitcoin_1234567"
    },
    //"aux_coin":       //删除
    //rsk_job_interval  //删除
    //rsk_coin          //删除
    //vcash_coin        //删除
    "main_coin_recipient": "1FtiSHFDTpLvurxnBsSTLNT3B4aqyRxm9x",
    "coin_recipients": [
    ],
    "pool_name": "FBPool",
    "coinbase_message": "FB/BTC",
```

### gateway 目录下的config.json

```json
    "flag": "debug" //日志级别为debug
    "diff_max": 1048576,
```

### metawriter 目录下的config.json

```json
    "flag": "debug" //日志级别为debug
```

### 创建日志目录

```sh
mkdir -p /var/log/pool/jobmaster
mkdir -p /var/log/pool/gateway
mkdir -p /var/log/pool/metawriter
```

## 启动

```sh
cd ../jobmaster
nohup ./jobmaster.exe config.json

cd ../gateway
nohup ./gateway.exe config.json

cd ../metawriter
nohup ./metawriter.exe config.json
```