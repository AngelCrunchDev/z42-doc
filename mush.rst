==================================================
蘑菇碎碎念
==================================================

HG
-----------------------

1. fetch 某个分支

   `hg fetch http://xxx.xxx.xxx.xxx:8000 -r <分支名>`

#. 在docker中互相fetch

   docker额外映射了一个端口到8000,可以通过这个端口

#. 关闭无名分支

   ::

      hg update -r <版本号>
      hg commit --close-branch -m 'Closing old branch'
      hg update -C default

翻墙有道
-----------------------

gentoo下emerge访问墙外资源
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. emerge设置HTTP代理

   在 `/etc/make.conf` 写入代理配置

   ::
      
      http_proxy="http://127.0.0.1:8080"
      https_proxy="http://127.0.0.1:8080"

#. 安装配置HTTP代理工具polipo

    `sudo emerge polipo` 即可完成安装,安装后在 `/etc/polipo/conf` 中写入

   ::

      daemonise=false
      diskCacheRoot=/var/cache/polipo/
      proxyAddress=127.0.0.1
      proxyName=localhost
      cacheIsShared=true
      allowedClients=127.0.0.1
      proxyPort=8080
      socksParentProxy = 127.0.0.1:1080
      socksProxyType = socks5

#. 配置shadowsocks

   ::

      {   
          "server":"vpn.mushapi.com",
          "server_port":1081,
          "local_address": "127.0.0.1",
          "local_port":1080,
          "password":"btyh17mxy",
          "timeout":300,
          "method":"aes-256-cfb",
          "fast_open": false,
          "workers": 1
      }

vim黑科技
-----------------------

1. 遇到gbk乱码囧木办
   
    ::

        set encoding=utf-8
        set fenc=cp936
        set fileencodings=cp936,ucs-bom,utf-8
        if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
            set ambiwidth=double
        endif
        set nobomb

#. 粘贴后格式错乱怎么办

   有的时候，在插入模式下从系统粘贴板粘贴文本到vim中会出现缩进异常的情况，为了解决这种问题，在粘贴前应该设置vim为粘贴模式并在粘贴完成后取消粘贴模式

   `:set paste`

   `:set nopaste`

vim插件及使用
-----------------------

1. syntastic 在错误之间跳转
   
    :lnext 跳到下一个

    :lprev 跳到上一个

#. 使用pyflakes进行语法检查 

    :SyntasticCheck pyflakes

iptables
-----------------------

1. 列出所有规则

   `iptables -nvL  -t nat --line-number <chain name>`

   列出nat表的所有规则并显示行号

#. 清零流量统计

   `iptables -Z <Chain>`

#. 删除

   `iptables -t nat -D DOCKER 13`

   删除nat表DOCKER链的第13行的规则

#. 用iptables给Docker添加端口映射 

   `iptables -t nat -A DOCKER --in-interface \!docker0 -p tcp --dport 6666 -j DNAT --to 172.17.0.5:6666`

   docker会在系统中创建一个叫docker0的网卡，本例中172.17.0.5就是docker0的IP地址

linux命令
-----------------------

ssh客户端配置文件
^^^^^^^^^^^^^^^^^^^^^^^

当主机较多的时候，不方便记住所有的IP、用户、端口以及密码，为了解决这个问题我们可以使用一个ssh的配置文件来记录这些服务器。

常用的配置有

    ::

        Host 主机别名
        HostName 主机地址
        User 登陆用户名
        Port 端口号
        IdentityFile 公钥 

在~/.ssh/目录下创建一个config文件，在config中写入相应的配置后就可以使用 `ssh \<主机别名\>` 直接连接服务器了

多线程下载工具axel
^^^^^^^^^^^^^^^^^^^^^^^

curl和wget是单线程的，使用这货的多线程方式下载文件会显著提高下载速度

1. 安装

   gentoo下 `sudo emerge axel`

   centos下 `sudo yum install axel`

#. 使用

   ::

       axel -n <线程数> -o <保存文件的目录> <下载地址>

docker 的一个奇怪命令
^^^^^^^^^^^^^^^^^^^^^^^

docker run -e MYSQL_ROOT_PASSWORD=rstfsgbcedh --expose 3306  --entrypoint="/entrypoint.sh" --name mysql-hg -d mush/mysql-hg mysqld

如果遇到 TERM environment variable not set. 就执行 `export TERM=dumb`
 
redis批量删除key
^^^^^^^^^^^^^^^^^^^^^^^

::

    EVAL "local keys = redis.call('keys', ARGV[1]) \n for i=1,#keys,5000 do \n redis.call('del', unpack(keys, i, math.min(i+4999, #keys))) \n end \n return keys" 0 investment_0*

    EVAL "local keys = redis.call('keys', ARGV[1]) \n for i=1,#keys,5000 do \n redis.call('del', unpack(keys, i, math.min(i+4999, #keys))) \n end \n return keys" 0 s_idx_cache_*

    EVAL "local keys = redis.call('keys', ARGV[1]) \n for i=1,#keys,5000 do \n redis.call('del', unpack(keys, i, math.min(i+4999, #keys))) \n end \n return keys" 0 autocom*

开发服务器环境介绍
-----------------------

开发服务器上通过使用docker来为每人提供一个独立的开发环境，通过主机上的nginx来将每人的域名分别通过反代指向他的docker。
我们使用了一个数据卷容器充当数据库文件目录，启动ssh供登陆开发.


添加一个新的开发docker
^^^^^^^^^^^^^^^^^^^^^^^

1. 启动一个数据卷容器
 
   `docker run -d -v /data --name \<your name\>_data pevc/data echo data_only for database`

#. 启动一个开发容器

   `docker run -d -i -p 9005:80 -p 10005:22 -p 8005:8000  --volumes-from \<your name\>_data --name \<your name\>_42web mush/ac /usr/sbin/sshd -D -f /etc/ssh/sshd_config`

   需要注意端口号，run之前先看下别人用了哪些端口了，一般就将端口号加一就行了。

#. 配置dns和主机的nginx反向代理

   在/etc/dnsmasq.conf解析你要使用的域名。

   ::

        address=/mushapi.info/192.168.10.169
        address=/*.mushapi.info/192.168.10.169

   在/etc/nginx/conf.d中加入你的反向代理配置。

.. code-block:: nginx

        server {
            listen 80;
            server_name mushapi.info *.mushapi.info;
            location / {
                    proxy_pass http://127.0.0.1:9000;
                    proxy_set_header Host $host;
                    proxy_set_header X-Real-IP $remote_addr;
                    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            }
        } 

dnsmasq配置
^^^^^^^^^^^^^^^^^^^^^^^

1. 解析和泛解析
    
    在`/etc/dnsmasq.conf`中添加下面的代码

    ::

        address=/mushapi.info/192.168.10.169
        address=/*.mushapi.info/192.168.10.169

#. cname解析

   假设我们要将a.com用cname指向b.com，则需要首先在本地hosts中增加b.com的解析，再向/etc/dnsmasq.conf中添加cname解析。

   修改/etc/hosts,增加一行

   `<some ip> b.com`

   在dnsmasq.conf中增加

   `cname=a.com,b.com`

不要依赖工具
-----------------------


redis分析工具
^^^^^^^^^^^^^^^^^^^^^^^

https://github.com/sripathikrishnan/redis-rdb-tools

Python抽象方法
-----------------------

Python中抽象方法有两种实现,一是通过抛出 `NotImplementedError` 异常, 而是通过abc模块.

例如

.. code-block:: python

    class Base:
        def foo(self):
            raise NotImplementedError()

        def bar(self):
            raise NotImplementedError() 

和

.. code-block:: python

    from abc import ABCMeta, abstractmethod

    class Base(metaclass=ABCMeta):
        @abstractmethod
        def foo(self):
            pass

        @abstractmethod
        def bar(self):
            pass

使用Docker的正确姿势
-----------------------

压缩Docker镜像的体积
^^^^^^^^^^^^^^^^^^^^^^^

::
 
    docker export <要压缩的容器> | docker import - <新镜像名字>

使用go语言编写一个可以放到Docker中的静态可执行文件并生成为一个Docker容器
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

go语言是个好东西,吉祥物都那么萌.

::

    go build  -a -ldflags '-s' <要编译的Go文件>

然后再DockerFile里这么写

::

    FROM scratch
    ADD <编译粗来的可执行文件> /
    ENTRYPOINT ["<编译粗来的可执行文件>"]

我研究这个问题的起因是我只想弄个echo到Docker里面,因为你run一个Docker的时候必须指定一个运行的命令.但我把echo这个可执行文件搞进去发现不能用.具体的可以参看这里,http://blog.xebia.com/2014/07/04/create-the-smallest-possible-docker-container/

监控Docker容器内存使用情况

::

    cat /sys/fs/cgroup/memory/system.slice/docker-88018f8043d00669bbf865855ebc8a6ccc93a04ce588111e01d4e63739250340.scope/memory.stat

应对怪需求的好方法
-----------------------

关于dict顺序的问题
^^^^^^^^^^^^^^^^^^^^^^^

经常的我们有一些字段为枚举,然后在页面上要用select的形式展现,往往善变的产品会要求改变下拉菜单条目出现的顺序,我们可以这样应对.

.. code-block:: html

    <select name="stage"  ms_duplex="o.com_base_info.stage" class="spinput">
        <option value="0">请选择阶段</option>
        % for k, v in COM_STAGE_DICT.iteritems():
        <option value="${k.value}">${v}：${COM_STAGE_COMMENT_DICT[k.value]}</option>
        % endfor
    </select>

.. code-block:: python

    COM_STAGE_DICT = collections.OrderedDict()
    COM_STAGE_DICT[COM_INFO_STAGE.CONCEPT] = '概念阶段'
    COM_STAGE_DICT[COM_INFO_STAGE.DEVELOPING] = '研发阶段'
    COM_STAGE_DICT[COM_INFO_STAGE.RELEASED] = '正式发布'
    COM_STAGE_DICT[COM_INFO_STAGE.GETUSERS] = '已有用户'
    COM_STAGE_DICT[COM_INFO_STAGE.PROFIT] = '已有收入'
    # COM_STAGE_DICT = {
    #     COM_INFO_STAGE.CONCEPT : '概念阶段',
    #     COM_INFO_STAGE.DEVELOPING : '研发阶段',
    #     COM_INFO_STAGE.RELEASED : '正式发布',
    #     COM_INFO_STAGE.GETUSERS : '已有用户',
    #     COM_INFO_STAGE.PROFIT : '已有收入',
    # }   
