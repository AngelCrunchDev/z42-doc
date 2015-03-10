如何编译 reST 文档
------------------

reST 文档的编译依赖 make 和 sphinx，安装完依赖后在文档的根目录执行
`make html` 构建 HTML 文档，如无错误即可在 `_build/html` 目录中生成对应的 HTML 文件，
可以在浏览器中直接打开 `_build/html/index.html` 预览生成的 HTML。

本文档托管在 ReadTheDocs，文档合并之主分支后将会自动构建，预览请访问 `RTFD <http://z42.readthedocs.org/zh/latest/>`_ 。
