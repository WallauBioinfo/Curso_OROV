sudo apt update -y && sudo apt upgrade -y && sudo apt install curl git python3-pip uidmap squashfs-tools -y && sudo apt-get clean

curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/1.5.7 | tar -xvj bin/micromamba
./bin/micromamba shell init -s bash -p ~/micromamba
source ~/.bashrc
micromamba activate