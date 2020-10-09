# INSTALL KUBERNETES INTO THE RASPBERRY PI CLUSTER

Add this line into `/boot/cmdline.txt`:

```bash
cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory
```
and then reboot.

Once rebooted, have to disable swap:

```bash
sudo dphys-swapfile swapoff && \
sudo dphys-swapfile uninstall && \
sudo update-rc.d dphys-swapfile remove
```

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

Finally, once initiated your cluster, add Flannel into it: https://github.com/coreos/flannel#flannel

>**References:**
>
>https://medium.com/nycdev/k8s-on-pi-9cc14843d43
>
>https://github.com/kubernetes-sigs/kubefed
>
>https://askubuntu.com/questions/91543/apt-get-update-fails-to-fetch-files-temporary-failure-resolving-error
>
>https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/troubleshooting-kubeadm/
> 
> RENAME LABELS: https://stackoverflow.com/questions/48854905/how-to-add-roles-to-nodes-in-kubernetes

