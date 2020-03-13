# INSTALL KUBERNETES INTO THE RASPBERRY PI CLUSTER

To install Kubernetes into a Raspberry Pi, you should run these commands:

```bash
root$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

root$ echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

root$ sudo apt-get update && sudo apt-get install -qy kubeadm kubectl kubelet
```

However, if you have a Raspberry Pi Cluster, you can use our script `runCommand.sh` to run these commands above into each Raspberry Pi in the cluster:

```bash
sh runCommand.sh "curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - ; echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > tmp; sudo mv tmp /etc/apt/sources.list.d/kubernetes.list; sudo apt-get update && sudo apt-get install -qy kubeadm kubectl kubelet"
```

>**References:**
>
>https://medium.com/nycdev/k8s-on-pi-9cc14843d43
>https://github.com/kubernetes-sigs/kubefed
>https://kubernetes.io/docs/concepts/cluster-administration/federation/
