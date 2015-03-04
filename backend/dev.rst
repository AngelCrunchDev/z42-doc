.. _dev:

======================
天使汇开发流程简介
======================


python
------

-  闭包
-  正则表达式
-  collections
-  defaultdict
-  itertools
-  enum
-  IntEnum
-  enumerate
-  time.mktime(time.strptime("2007-03-04 21:08:12", "%Y-%m-%d
   %H:%M:%S"))
-  dateparser
-  python 的 新式类与旧式类 ， 以及super的意义


supervisor
----------

-  线上服务器如何看异常


开发流程
---------------

新建一个页面通常需要创建几个文件：

* 模板 zapp/SITE/model/模块名.py
* 视图 zapp/SITE/view/模块名.py
* Coffee Script 脚本 coffee/SITE/auth/模块名/视图名.coffee
* Make 模板 html/SITE/auth/模块名/视图名.html
* CSS 样式文件 css/SITE/auth/模块名.css

并在 `_url.py` 中注册视图。


-  新建url页面
-  render
-  css，js的引用
-  merge.conf
-  新建css，js，修改merge.conf需要重启开发服务器
-  View的类型
-  分页
-  在页面取得当前用户
-  搜索
-  自动补全
-  gearman 异步调用
-  JsOb
-  rendermail 发送邮件
-  redis key的定义 ， R.
-  model 中 使用绝对路径import以防止redis提示key重复定义
-  import \_env
-  配置文件 的 定义 与 自适应
-  make.py 生成配置文件


Mako 模板
---------------

Mako 模板的存放路径通常是 42web/html/SITE/模块名/文件名.html。
Mako 模板的使用见 `教程 <http://docs.makotemplates.org/en/latest/>`_ ，通用部分通常需要剥离成一个 _base.html 文件中，
不被直接 render 的模板命名以下划线 `_` 开头。

一个基本的模板文件大概是这样的::

    ## 这里继承父模版
    <%inherit file="/SITE/_base/default.html" />
    ## 添加头文件、CSS 文件
    <%block name="head">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0, width=device-width">
    ## 这里引入 CSS 文件，将目录名中的斜线换成下划线作为变量传入
    <link rel="stylesheet" href="${css.SITE_auth_m}" />
    </%block>

    <%block name="script">
    ## 在文件尾引入 JS 文件，变量名同为替换后的目录名，JS 文件来自于变异 Coffee Script
    <script src="${js.SITE_auth_m_m}"></script>
    </%block>


Coffee Script
----------------

网页脚本用 Coffee Script，写完后需编译为 JavaScript
（添加新的 CS 脚本需要手动重启 dev.sh 脚本，修改已存在的脚本会自动变异成 JS）。


Python Model
-----------------

数据存储使用的是 MongoDB，通过封装过的 MongoKit 将数据 model 对应上 MongoDB 文档，
需要 `from z42.web.mongo import mongo` 。下面是一个简单的 model 文件示例::

    from z42.web.mongo import Doc
    from z42.web.mongo import mongo

    class UserIM(Doc):
        structure = {
            'user_id': int,
            'phone': basestring,
            'qq': basestring,
            'weixin':basestring
        }

创建一个 UserIM 对象使用 upsert() 方法，如 `UserIM({'phone': PHONE}).upsert({user_id: 1001})` ，
这行代码的作用是：如果存在 user_id 为 1001 的 UserIM，则将其 'phone' 设置为 PHONE，
否则在 MongoDB 中插入这样一个 JSON 文档： {'user_id': 1001, 'phone': PHONE}。


Python View
-----------------

   -  View
   -  HostView
   -  LoginView
   -  AdminView
   -  GodView
   -  JsonErrView
   -  RpcView
   -  组合 View

web 开发使用的框架是修改过的 Tornado，需要通过装饰器注册 URL。
新建一个简单的 view 如下::

    from _route import route
    from z42.web.view.j import JsonErrView
    from jsob import JsOb
    from zapp.SITE.view._base import HostView

    @route('/m/register/')
    class register(HostView):
        def get(self, sign):
            self.render()

    @route('/j/m/')
    class _(JsonErrView, HostView):
        def post(self, sign):
            err = JsOb()            # 使用 JsOb 对象保存错误信息
            o = self.json           # 获取 JSON 化的 POST 信息
            if not o.title:
                err.title = "链接已失效！"
            if not err:
                do_something()
            self.render(err)

这个 module 注册了两个 view，一个注册页面和一个 Ajax 接口。route 方法是一个用于注册 URL 的装饰器，
装饰在 Handler class（通常继承自XxxView）上即可。

register class 就是视图 Handler 的最简写法。对于 Ajax 视图，Handler 名意义不大，可以使用下划线命名。
需要返回错误提示的视图，可以继承 JsonErrView。View 的继承用法详见 :ref:`views`


上线流程
-----------------

-  修改函数接口后， 用ag查找并修改些调用过的地方
-  函数命名规则 ：名词在前动词在后 ， 常用命名如下

-  user\_new 新建
-  user\_rm 删除
-  user\_dumps 返回一个包含各种相关数据的json对象
-  user\_id\_list\_by\_com\_id(limit, offset) 查询
-  user\_new 新建
-  user\_rm 删除
-  user\_dumps 返回一个包含各种相关数据的json对象
-  user\_id\_list\_by\_com\_id(limit, offset) 查询
-  user\_id\_count\_by\_com\_id

我们通常把user\_id作为第一个参数
