sudo apt update
sudo apt install -y docker.io
systemctl start docker
systemctl enable docker
docker version

# 1、添加源
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
# 2、安装并重启
sudo apt-get update && sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker
# 3、测试
docker run --runtime=nvidia --rm nvidia/cuda:10.2-base nvidia-smi
