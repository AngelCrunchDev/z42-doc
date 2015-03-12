.. _director:

===========
director.js
===========

:作者: 王然 kxxoling@gmail.com

简介
----

`director <https://github.com/flatiron/director#client-side-routing>`_ 提供前端和后端的
路由解决方案，可以用于控制前端路由以及页面代码的显示与否。

使用很简单：

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>Director Example</title>
        <div id="results"></div>
        <script src="http://www.javascriptoo.com/application/html/js/flatiron/director/director.min.js"></script>
        <script>
        var r = document.getElementById('results');
            var data = {
                people: [
                    { 'firstName': 'Clark', 'lastName': 'Kent' },
                    { 'firstName': 'Bruce', 'lastName': 'Wayne' },
                    { 'firstName': 'Peter', 'lastName': 'Parker' }
                ]
            }
            var viewPerson = function(personId) { r.innerHTML = data.people[personId].firstName + ' ' + data.people[personId].lastName; };
            var routes = {'/person/view/:bookId': viewPerson};
            var router = Router(routes);
            router.init();
        </script>
      </head>
      <body>
        <ul>
          <li><a href="#/person/view/0">Clark</a></li>
          <li><a href="#/person/view/1">Bruce</a></li>
          <li><a href="#/person/view/2">Peter</a></li>
        </ul>
      </body>
    </html>

效果预览： `GitHub Pages <http://angelcrunchdev.github.io/z42-doc/director>`_
