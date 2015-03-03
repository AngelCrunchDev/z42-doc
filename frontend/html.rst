.. _html:

=====================================================================
HTML + CSS
=====================================================================

HTML
----

-  label for属性

绑定表单元素id，实现点击label选中相应radio或checkbox \*
链接都必须写上href属性， 空链接请写成::

::

    <a href="javascript:void(0)"></a>

-  反复出现的按钮图标用 a标签 配合 css设置背景图
   来实现，不要反复的写img标签（减少代码的冗余度）

CSS
---

-  模块分级

   -  全局级
   -  模块级
   -  页面级

-  分栏布局

例如左宽665px,父容器宽1000px,在layout.css中定义::

    .R665{float: left; margin-left: 688px; width:312px;}
    .L665{float: left; width: 665px; margin-left: -100%;}

参考:

`双飞翼布局 <http://www.dqqd.me/flying-wing/>`_
`常见布局 <http://blog.html.it/layoutgala/>`_

-  绝对底部

``CSS Sticky Footer <http://paranimage.com/css-sticky-footer/>``\ \_ \*

清除浮动 \* 子选择器

::

    利用父级元素id进行选择

-  ``图文混排 <http://dabblet.com/gist/4094139>``\ \_
-  CSS盒模型
-  垂直居中
-  如何制作三角
-  :first-child 和 :last-child

   -  案例 : 圆圈 , padding

-  如果内容可变，就不要设置高度
-  写完页面依次检查

   -  对齐
   -  字体

      -  大小
      -  粗细
      -  颜色

   -  留白

-  邮件

   ``Css Inliner Tool <http://templates.mailchimp.com/resources/inline-css/>``\ \_

-  42web

   -  HTML中如何引用图片

   图片上传至七牛，使用外链地址

   -  CSS中如何引用图片::

        background:url(/css/\_img/xxx)

   -  不要引用站外的图片

-  checkbox 和 radio 的 样式

``文字对齐 <http://www.zhangxinxu.com/wordpress/?p=56>``\ \_ \*

不要用空格做间距


我们常用的CSS样式
-----------------

-  按钮

   -  功能
   -  强调

设计
----

-  对齐
-  留白的一致性
-  粗体
-  字号

javascript
----------

-  获取时间戳::

   (new Date).geTime()
-  在js中取得当前用户::

   $.current\_user
-  $$

例如调用弹窗(可有多个参数)::

::

    $$('SITE/auth/login')

-  require
-  $.require
-  $.dialog * 需要登录调用.login\_dialog(参考submit\_project.coffee)
-  $.errtip ::

    err = {}

    if xxx: err.xxx = "xx" if xx : err.xx ="xx"

    ::

       if not errtip.set err:
          xxxxx

jQuery
------

-  $.extend([deep],target,object)


jQuery 自定义扩展
-----------------

-  $.timeago

接受一个时间戳作为参数,返回距离当前时间描述 \* $.isotime \* $.getJSON1
\* jsonp 跨域调用 \* $.postJSON1 \* $.html 模版

参考egg\_new.coffee

jQuery UI
---------

-  Accordion
-  Datepicker
-  Tagit

CoffeeScript
------------

-  ``在页面中直接写coffee <http://coffeescript.org/#scripts>``\ \_

avalon
------

-  命名规则的修改

   "-"改为"\_"
-  ms\_view
-  操作类似view的复用
-  view与数据结构的模块划分原则（每一个保存的url对应一个view）
-  ``$remove <http://limodou.github.io/avalon-learning/zh_CN/event.html>``\ \_
-  ``$watch <http://limodou.github.io/avalon-learning/zh_CN/watch.html>``\ \_
-  如何定义avalon组建

   -  创建既可以单独使用，也可以在循环中使用的avalon组件

参考ui\_follow.coffee

Firebug
-------

-  控制台面板中，点击“保持”按钮，页面重新载入时不清空面板

杂项
----

-  ``七牛剪裁 <http://developer.qiniu.com/docs/v6/api/reference/fop/image/imageview2.html>``\ \_
-  上传文件
-  上传头像
-  地址选择

工具
----

-  Chrome插件

   -  PerfectPixel
   -  Page Ruler

-  Windows

   -  Color Picker

入门篇
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. `网页设计师 <https://bitbucket.org/zuroc/42qu-school/src/02ffbde7b7e4/book/%E7%BD%91%E9%A1%B5%E8%AE%BE%E8%AE%A1%E5%B8%88.chm>`_ , 初学者可以从其中 » 循序渐进 章节开始自己的学习之旅

#. `HTML中文手册 <https://bitbucket.org/zuroc/42qu-school/src/02ffbde7b7e4/book/html.chm>`_

#. `CSS中文手册 <https://bitbucket.org/zuroc/42qu-school/src/02ffbde7b7e4/book/css.chm>`_

#. `CSS3 系列教程 <http://www.blueidea.com/tech/web/2009/6460.asp>`_

#. `Javascript教程 <http://www.w3school.com.cn/js/index.asp>`_

#. `15天学会jquery <https://bitbucket.org/zuroc/42qu-school/src/02ffbde7b7e4/book/15%E5%A4%A9%E5%AD%A6%E4%BC%9Ajquery.pdf>`_

#. `jquery中文手册 <https://bitbucket.org/zuroc/42qu-school/src/02ffbde7b7e4/book/jquery.chm>`_

基本库
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. `Aliceui 支付宝的前端框架 <http://aliceui.org/>`_

Javascript
=====================================================================

基本库
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#. `Jquery <http://jquery.com/>`_
#. `Jquery UI <http://jqueryui.com/>`_
#. `director 前端路由库 <https://github.com/flatiron/director>`_

实用库
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#. `Tag-it 标签 <http://aehlke.github.io/tag-it/examples.html>`_
#. `imgareaselect图片剪裁 <http://odyniec.net/projects/imgareaselect/>`_
#. `Highlight文字高亮 <http://unwrongest.com/projects/highlight/>`_
#. `FancyBox弹出框 <http://fancybox.net/>`_
#. `Poshy Tip jQuery Plugin 消息提示 <http://vadikom.com/demos/poshytip/>`_
#. `摄像头拍照 <https://github.com/jhuckaby/webcamjs>`_



图表库
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#. `Open Flash Chart <http://teethgrinder.co.uk/open-flash-chart/>`_
#. `highcharts <http://www.highcharts.com/>`_
#. `Morris.js <http://oesmith.github.com/morris.js/>`_
#. `Flot <http://code.google.com/p/flot/>`_

扩展阅读
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#. `Arale 支付宝的前端开发体系 <http://aralejs.org/>`_
#. `学习CSS布局  <http://zh.learnlayout.com/>`_
#. `双飞翼布局  <http://www.dqqd.me/flying-wing/>`_
#. `常用布局  <http://blog.html.it/layoutgala/>`_
#. `PNG压缩  <https://tinypng.com/>`_
#. `JPG压缩  <http://www.jpegmini.com/>`_
#. `完美的CSS绝对底部  <http://paranimage.com/css-sticky-foot/>`_
#. `AliceUI <http://aliceui.org/docs/framework.html/>`_
#. `colorMania取色器  <http://www.blacksunsoftware.com/colormania.html/>`_
#. `emmet-vim  <http://www.ruanyifeng.com/blog/2013/06/emmet_and_haml.html/>`_

云服务
=====================================================================

#. `stathat.com 在线统计图表 <https://www.stathat.com>`_

