SSO App 示例
============

注册 App
--------

注册脚本如下：

.. code:: python

    import requests


    def get_token():
        host = 'b.dev'                              # App 域名
        app_name = 'test app'                       # App 名
        sso_host = 'sso.%s' % host                  # App 的 SSO 域名
        sync_url = 'http://%s/sso_sync' % host      # 数据同步接口
        login_url = 'http://%s/sso_login' % host    # 登录回调接口

        r = requests.get(SSO_REGISTER_URL, params=dict(
                         o='["%s","%s","%s","%s","%s"]'
                         % (app_name, host, sso_host, sync_url, login_url)))
        return r.text


    if __name__ == '__main__':
        print get_token()

注册成功则会获得这样的结果：

::

    [9912683,"VlO9Yt0J_fTFRxrEONVY6s4JZCK2myxwGTeNxfw7Dh-O4cx9WsHMUvDFJQOWtKks"]

其中 ``9912683`` 是应用的
``app_id``\ ，\ ``VlO9Yt0J_fTFRxrEONVY6s4JZCK2myxwGTeNxfw7Dh-O4cx9WsHMUvDFJQOWtKks``
是 App 的身份认证 token。

身份验证
--------

