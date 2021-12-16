default['nginx_env']['pkglist'] = ["gcc", "zlib", "pcre", "openssl", "openssl-devel", "pcre-devel", "zlib-devel", "geoip-devel"]
default['nginx_env']['ngx_tarname'] = "nginx-1.20.0.tar.gz"
default['nginx_env']['ngx_tmploc'] = "/tmp"
default['nginx_env']['ngx_instloc'] = "/app/nginx"
default['nginx_env']['ngx_user'] = 'wlapp'
default['nginx_env']['ngx_group'] = 'wlapp'
default['nginx_env']['ngx_cfgargs'] = "--user=#{default['nginx_env']['ngx_user']} --group=#{default['nginx_env']['ngx_user']} --prefix=#{default['nginx_env']['ngx_instloc']}  --with-http_ssl_module --with-http_realip_module --with-http_geoip_module  --with-stream_realip_module --with-stream  --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_gunzip_module --with-http_auth_request_module"
default['nginx_env']['ngx_lifecycle_action'] = "install"
