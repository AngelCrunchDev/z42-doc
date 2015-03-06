docker
======

预习材料
--------

`docker
中文文档 <http://www.widuu.com/chinese_docker/installation/windows.html>`__

MAC使用
-------

mac用iterm运行 boot2docker ssh 可以进入虚拟机

重启mac以后需要先 book2docker start

windows使用
-----------

可以用xshell登录到虚拟机方便使用

基本用法
--------

从镜像文件新建一个虚拟机 ::

    docker run -t -i -p 80:80 -p 2200:22 --name 42 6e469ec45c90 /bin/bash

    docker run -d -p 80:80 -p 2222:22 --name 42 zuroc/42web /usr/sbin/sshd -D

ifconfig 可以看到docker母机的ip

重新进入一个虚拟机 ::

    docker start -i 42

浏览所有虚拟机 ::

    docker ps -a


一次性删除所有的容器 ::

    docker rm $(docker ps -q -a)

一次性删除所有的镜像。 ::

    docker rmi $(docker images -q)

docker commit 37a3eb81fb77 zuroc/42web 保存一个虚拟机为镜像 docker ::

    export 42 \| xz -c > 42.txz

    rsync -avhP docker.txz root@42py.com:/data

docer export 对应

导入的命令是 cat docker\_42web.bz2 \| docker import - zuroc/42web

我这里用的是niubi：latest ...... ::

    $ sudo ifconfig docker0 docker0 Link encap:Ethernet HWaddr xx:xx:xx:xx:xx:xx inet addr:172.17.42.1 Bcast:0.0.0.0 Mask:255.255.0.0

http://linuxwiki.github.io/Services/Docker.html#62docker0-ip

::
    docker export bb6ce0f8e59c \|bzip2 -c > 42.tar.bz2

    sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8000 -j DNAT
    --to 172.17.0.17:8000

mysql 密码 42web 解析

修改本机host ， 加入

a.com xx.xxx.xx.xx sso.a.com xx.xxx.xx.xx

进入虚拟机后先运行boot sudo /etc/init.d/sshd start
可以启动ssh服务用xshell来登录 ::

    sudo /etc/init.d/sshd start

    ~/ac/zapp/TECH2IPO $ ./dev.sh

    brew install dnsmasq

    brew install dnsmasq


Mac安装DNSMASQ
-------------------------------------

要安装dnsmasq，你需要先安装 Homebrew 。

它自称“OS X 不可或缺的套件管理器”。


安装Homebrew
-------------------------------------

请打开 终端 （应用程序>实用工具），并运行 ::

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

你需要按照提示来继续安装。这个过程或许会很慢，受限于网络状况。如果实在很慢，你可以在VPN环境下安装。

安装完成之后，你就可以使用brew命令来安装dnsmasq了。

安装并配置dnsmasq组件!

仍然在终端运行 ::

    brew install dnsmasq

等待安装完成后，请在 /usr/local/ 文件下新建一个 etc 文件夹。

现在把 /usr/local/opt/dnsmasq/dnsmasq.conf.example 文件拷贝至并重命名为
/usr/local/etc/ dnsmasq.conf 。

在刚刚的 /usr/local/etc/ 文件夹下新建一个 resolv.dnsmasq.conf 文件。

用sublime text，textmate，bbedit等纯文本编辑器打开这个
resolv.dnsmasq.conf 文件，输入以下内容 ::

    nameserver 223.5.5.5 nameserver 223.6.6.6 nameserver 178.79.131.110

这些都是你常用的DNS地址，你可以添加更多，比如OpenDNS。

用sublime text，textmate，bbedit等纯文本编辑器打开同文件夹下的
dnsmasq.conf 文件，增加以下内容 ::

    resolv-file=/usr/local/etc/resolv.dnsmasq.conf

    strict-order

    no-hosts

    cache-size=32768

    listen-address=127.0.0.1

    address=/c.cc/192.168.59.103 address=/a.com/192.168.59.103

这就是最简单的配置文件。需要说明的是，listen-address后面的可以是多个IP用英文逗号隔开，例如你写listen-address=127.0.0.1,192.168.1.102，其中192.168.1.102是你的计算机的内网IP，就可以实现同一个局域网内的设备，通过设置DNS为这个IP，来实现都通过你的dnsmasq来查询dns，即局域网范围内的DNS泛解析。

要运行并且开机自动运行dnsmasq，在终端运行 ::

    sudo cp -fv /usr/local/opt/dnsmasq/\*.plist /Library/LaunchDaemons sudo
    launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

现在，你可以通过把Mac系统的DNS改为127.0.0.1来使用dnsmasq。同局域网的用户也可以修改DNS到此台Mac的IP即可。前提是要把此台Mac的局域网IP写到listen-address里。

.. figure:: http://img.hb.aicdn.com/f57480ce42715b9c489ab7ecfe57a0984058592bac19-tVhEuN
   :alt: 配置dns

   配置dns

dnsmasq dns config 要检查运行情况，你可以在终端运行 ::

    dig g.cn

来检查是否在使用本地的dnsmasq进行dns解析。

DNSMASQ 泛解析
-------------------------------------

上面只是安装好了dnsmasq，下面来具体介绍DNSMASQ的泛解析功能，来突破墙，实现谷歌服务直连。要添加规则，只需在dnsmasq.conf文件里追加内容即可。

DNSMASQ的泛解析规则是这样的： ::

    address=/baidu.com/1.1.1.1

这意味着，\ *.baidu.com/*\ 都将被引导至IP为1.1.1.1。
