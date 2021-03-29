## Create a Kubeadm Cluster

1. Have at least two virtual machines either running on-prem or in the cloud. The VMs must have:
   - At least 2 CPUs
   - at least 4GB RAM

Run updates on the VMs

```
sudo apt update -y
```

2. Install apt-transport-https. This is for any package managers using `libapt-pkg` to access metadata and packages available in sources accessible over https

```
sudo apt-get install -y apt-transport-https curl
```

3. Install Docker

```
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
systemctl status docker
```

4. Configure the Docker daemon to use `systemd` for `cgroups`

```
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
```

```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

5. Install and Configure containerd

```
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system
```

```
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd
```

```
sudo vim /etc/containerd/config.toml
```


Find the `systemd_cgroup = false` and set it to `true`

6. Install packages needed for the Kubernetes repo

```
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

7. Update

```
sudo apt update -y
```

8. Install Kubeadm, kubelet, and kubectl

```
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

9. Disable swapping on Ubuntu as Kubernetes is not compatible with it. Swap is memory stored in HD

```
swapoff -a
```

10. Reload Daemon

```
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

11. Initialize Kubeadm

Class A CIDR range

```
sudo kubeadm init --apiserver-advertise-address 172.16.2.4 --pod-network-cidr=172.16.0.0/16
```

12. Set up the networking for the Kubernetes cluster (https://kubernetes.io/docs/concepts/cluster-administration/networking/)

```
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
```