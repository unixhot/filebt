# filebt

基于murder的P2P文件分发工具

在Twitter开源的[murder](https://github.com/lg/murder)的基础上，增加一些便于使用的脚本。

## 产生背景

不管是使用SaltStack还是Ansible，仅支持小文件的分发，在分发大文件的时候速度非常慢，甚至会有卡死的现象，之前用过murder，封装一个方便自己使用的小工具，声明一下，真的没有什么创新，呵呵...

## 部署手册

1.克隆filebt代码
```
[root@linux-node1 ~]# git clone https://github.com/unixhot/filebt.git
```

2.部署tracker服务

```
[root@linux-node1 ~]# cd filebt/install/
[root@linux-node1 install]# ./install.sh tracker
```

## 使用手册

1.生成一个100M的测试文件
```
[root@linux-node1 ~]# dd if=/dev/zero of=bigfile.tar.gz count=1 bs=100M
```

2.为测试文件生成种子文件
```
[root@linux-node1 ~]# python /opt/filebt/murder_make_torrent.py bigfile.tar.gz 192.168.56.11:8998 bigfile.tar.gz.torrent
```




