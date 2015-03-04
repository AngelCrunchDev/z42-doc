==================================================
蘑菇碎碎念
==================================================

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

   `iptables -nvL  -t nat --line-number`

   列出nat表的所有规则并显示行号

#. 删除

   `iptables -t nat -D DOCKER 13`

   删除nat表DOCKER链的第13行的规则

#. 用iptables给Docker添加端口映射 

   `iptables -t nat -A DOCKER --in-interface \!docker0 -p tcp --dport 6666 -j DNAT --to 172.17.0.5:6666`

   docker会在系统中创建一个叫docker0的网卡，本例中172.17.0.5就是docker0的IP地址

   
