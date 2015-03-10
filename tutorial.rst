.. _tutorial:

===================================
应用开发教程
===================================

STEP0: 熟悉项目目录结构
-----------------------------------



STEP2: 启动开发服务器
-----------------------------------

dev.sh

restart.sh



STEP1: 创建项目所需文件
-----------------------------------

app 目录& `__init__.py`

_env.py

_route.py

root.py

j.py



STEP3: 配置路由&编写视图
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


STEP3: 第一个 Mako 文件
-----------------------------------

.. code-block:: mako

    <h1>Hello, ${ o }</h1>



STEP3: 第一个 Plim 文件
-----------------------------------

.. code-block:: mako

    <h1>Hello, ${ o }</h1>


STEP3: 第一个 SCSS/SASS 文件
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


STEP3: 第一个 CoffeeScript 文件
-----------------------------------

CoffeeScript ::

    ->
        alert 'Hello World!'


STEP3: 重启开发服务器
-----------------------------------

添加 CoffeeScript/JavaScript/CSS/SASS/SCSS 文件后需要手动重启服务器：

1. 结束当前 dev.sh

2. 运行 dev.sh
