sudo apt update && sudo apt install -y libhiredis-dev redis libev-dev build-essential m4 gcc g++ libcurl4-gnutls-dev libssl-dev libjansson-dev libkrb5-dev

cd ./network
make -j4