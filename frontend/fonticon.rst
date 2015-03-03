.. _fonticon:

=============
使用 FontIcon
=============

作者: 王然 kxxoling@gmail.com


为什么使用 FontIcon
-------------------

位图图片不能很好地进行缩放，当图片进行放大时会失真（即变模糊），当图片进行缩小时就会浪费掉像素。而且加载每一张图片都需要一次“http请求”，因此也拖慢了整个加载页面的时间。另外，要是没有图片编辑器（软件）的话就很难对图片进行编辑、处理等操作。

字体就不会有以上这些问题，字体可以进行随意缩放并且每一个字符都不需要进行额外的“http请求”。

其它优势：

很容易任意地缩放；
很容易地改变颜色；
很容易地产生阴影；
可以拥有透明效果；
一般来说，有先进的浏览器支持；
可以使用CSS来装饰（可以得到CSS很好支持）；
可以快速转化形态（做出一些变化，如 :hover等）；
可以做出跟图片一样可以做的事情（改变透明度、旋转度，等）；
本身体积更小，但携带的信息并没有削减。

扩展阅读：

http://www.w3cplus.com/css3/icon-fonts.html

http://isux.tencent.com/icon-font.html

http://io-meter.com/2014/07/20/replace-icon-fonts-with-svg/


如何使用
-------------------

上传自己的图片格式 icon：http://www.iconfont.cn/icons/uploadShow

收藏：点开特定的图标库，将鼠标移动到图标上，点击“购物车按钮”或者图标本身。

下载：点击搜索框左侧的“购物车按钮”，选择“下载至本地”。

在线存储：点击搜索框左侧的“购物车按钮”，选择“存储为项目”即可在线使用。
存储后会会生成自己的项目，点击“获取在线链接”橙色按钮，即可生成如下 CSS 代码： ::

    @font-face {
      font-family: 'iconfont';
      src: url('http://at.alicdn.com/t/font_1425368696_9550455.eot'); /* IE9*/
      src: url('http://at.alicdn.com/t/font_1425368696_9550455.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
      url('http://at.alicdn.com/t/font_1425368696_9550455.woff') format('woff'), /* chrome、firefox */
      url('http://at.alicdn.com/t/font_1425368696_9550455.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
      url('http://at.alicdn.com/t/font_1425368696_9550455.svg#iconfont') format('svg'); /* iOS 4.1- */
    }

复制按钮对应的 Unicode 编码，如 `&#xe600;` 即可在项目中作为文字使用。

在线演示： http://angelcrunchdev.github.io/z42-doc/fonticon.html

注：文件类型请选择 Unicode（默认）而非 FontClass。


获取 Icon 素材
-------------------

可以在这些提供免费图标下载的网站下载图片，在 IconFont 网站转换成 Font 后再使用：

http://flaticon.com
