#!/bin/bash
# Common stages for both master and worker nodes
# This can be use as user data in launch template or launch configutions 
sudo -i
hostname masterk8
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

sudo apt update -y
sudo apt install -y apt-transport-https -y

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt update -y
sudo apt install -y kubelet kubeadm  containerd kubectl
# apt-mark hold will prevent the package from being automatically upgraded or removed.

sudo apt-mark hold kubelet kubeadm kubectl containerd

sudo cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

sudo cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd

# Enable and start kubelet service
sudo systemctl daemon-reload
sudo systemctl start kubelet
sudo systemctl enable kubelet.service

#sudo kubeadm join 172.31.13.51:6443 --token nsw52x.jqv5lezwzlpfkeuq --discovery-token-ca-cert-hash sha256:289ef23de4847829acf89456fa644f07ad0eab312006a4c0d085af051dc0a83d


#======================explaination=================
#======================explaination=================



#!/bin/bash
# Common stages for both master and worker nodes
# This can be use as user data in launch template or launch configutions
sudo hostname node13

#1) swtch to root user
sudo -su -


#2) Turn off swap space/ disable swap memory
#free -m     show both memory and swap.
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


#3) #Install packages . To install     kubernetes and containered run this command 
#kubeadm, Kubelet, Kubectl, containerd

sudo apt update -y
sudo apt install -y apt-transport-https -y
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

# install kubelet kubeadm  containerd kubectl
sudo apt update -y
sudo apt install -y kubelet kubeadm  containerd kubectl

# apt-mark hold will prevent the package from being automatically upgraded or removed.
sudo apt-mark hold kubelet kubeadm kubectl containerd

#4) configure containered. Load the necessary modules for containerd

sudo cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter


#5) Setup the required kernal parameters.

sudo cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system

#6) configure containerd:

mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
systemctl restart containerd

#7) Start and Enable kubelet service
sudo systemctl daemon-reload
sudo systemctl start kubelet
sudo systemctl enable kubelet.service

#sudo kubeadm join 172.31.13.51:6443 --token nsw52x.jqv5lezwzlpfkeuq --discovery-token-ca-cert-hash sha256:289ef23de4847829acf89456fa644f07ad0eab312006a4c0d085af051dc0a83d


