.. _tutorial:

===================================
应用开发教程
===================================

熟悉项目目录结构
-----------------------------------

目录结构 ::

    -z42
        -z42  ------配置和公用库
        -zapp ------所有应用目录
            -ANGELCRUNCH -------- AngelCrunch网站目录
                -html ----------- Mako 模板和静态 HTML 目录
                -_html ---------- Mako 模板缓存路径
                -plim ----------- Plim 模板目录
                -css  ----------- CSS 文件目录
                -coffee --------- CoffeeScript
                -javascript ----- JavaScript 库和 CoffeeScript 编译生产的文件目录
                -model ---------- Python 对象
                -view ----------- Python 应用视图
                -dev.sh --------- 应用启动脚本
            -...         -------- 其它网站目录

对于 CoffeeScript、JavaScript、CSS、SASS、SCSS，其文件目录下的 `_lib` 用于存放第三方库/框架。


启动开发服务器
-----------------------------------

dev.sh

restart.sh



创建项目所需文件
-----------------------------------

app 目录& `__init__.py`

_env.py

_route.py

root.py

j.py



配置路由&编写视图
-----------------------------------

View 与 `tornado.web.RequestHandler`

\@route

.. code-block:: python

    # root.py
    ...
    @route
    class hello_world(View):
        def get(self):
            o = 'world'
            self.render()
    ...


第一个 Mako 文件
-----------------------------------

.. code-block:: mako

    <h1 id="hello" class="mako plim" data-height="10">Hello, ${ o }</h1>
    <div class="d1">
        <div class="d2">
            <span>div</span>
        </div>
    </div>
    <%include file="file.html"/>



第一个 Plim 文件
-----------------------------------

.. code-block:: slim

    h1#hello.mako.plim data-height=10
        Hello, ${ o }
    .d1
        .d2
            span
                |div
    -include file.html



第一个 SCSS/SASS 文件
-----------------------------------

SCSS ::

    $font-stack:    Helvetica, sans-serif;
    $primary-color: #333;

    body {
      font: 100% $font-stack;
      color: $primary-color;
    }

    nav {
      ul {
        margin: 0;
        padding: 0;
        list-style: none;
      }

      li { display: inline-block; }

      a {
        display: block;
        padding: 6px 12px;
        text-decoration: none;
      }
    }


第一个 CoffeeScript 文件
-----------------------------------

.. code-block:: coffeescript

    obj = {
        a: 1
        b: 2
        c： ->
            alert 'Hello World!'
    }

输出：

.. code-block:: javascript

    var obj = {
        a: 1,
        b: 2,
        c: function(){
            alert('Hello World');
        }
    }



重启开发服务器
-----------------------------------

添加 CoffeeScript/JavaScript/CSS/SASS/SCSS 文件后需要手动重启服务器：

1. 结束当前 dev.sh： `Ctrl-c`

2. 运行 dev.sh
