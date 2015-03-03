==================================================
蘑菇碎碎念
==================================================

vim插件及使用
-----------------------

1. syntastic 在错误之间跳转
   
    :lnext 跳到下一个

    :lprev 跳到上一个

2. 使用pyflakes进行语法检查 

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

   
