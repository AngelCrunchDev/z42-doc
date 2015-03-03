.. _fonticon:

=============
使用 FontIcon
=============

作者: 王然 kxxoling@gmail.com


为什么使用 FontIcon
-------------------


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
