.. _wowj:

=======
WOW.js
=======

:作者: 王然 kxxoling@gmail.com

WOW.js
-------

`WOW.js <https://github.com/matthieua/WOW>`_ 是一个基于 `animate.css` 的动画效果库，使用简单。


基本使用
---------

`WOW.js` 依赖于 `animate.css <https://daneden.github.io/animate.css/>`_ ，所以使用前需引用 `animate.css` 。 ::

    <link rel="stylesheet" href="css/animate.css">
    <script src="js/wow.min.js"></script>

初始化 ::

    <script>
     new WOW().init();
    </script>

`WOW.js` 根据 `.wow` 类标记需要添加动画效果的元素 ::

    <div class="wow">
      Content to Reveal Here
    </div>

再通过特定的类型设置动画类型，比如 `bounceInUp` 可以设置 `自上而下的反弹效果 <http://gh.windrunner.info/z42-doc/animate/wow.html#bounceInUp>`_ ::

    <div class="wow bounceInUp">
      Content to Reveal Here
    </div>

至此，已经实现了滚动时的动画效果。


高级设置
--------

data-wow-duration：动画的持续时间
data-wow-delay：动画出现的延迟
data-wow-offset：动画的偏移距离（相对于浏览器底部）
data-wow-iteration：动画出现的重复次数

::

    <section class="wow slideInLeft" data-wow-duration="2s" data-wow-delay="5s">
    </section>

    <section class="wow slideInRight" data-wow-offset="10"  data-wow-iteration="10">
    </section>


配置
----

boxClass: Class name that reveals the hidden box when user scrolls.

animateClass: Class name that triggers the CSS animations (’animated’ by default for the animate.css library)

offset: Define the distance between the bottom of browser viewport and the top of hidden box.
When the user scrolls and reach this distance the hidden box is revealed.

::

    wow = new WOW(
      {
        boxClass:     'wow',      // default
        animateClass: 'animated', // default
        offset:       0,          // default
        mobile:       true,       // default
        live:         true        // default
      }
    )
    wow.init();


相关链接
--------

`英文文档<http://mynameismatthieu.com/WOW/docs.html>`_
`官网及示例<http://mynameismatthieu.com/WOW/index.html>`_
`GitHub<https://github.com/matthieua/WOW>`_

