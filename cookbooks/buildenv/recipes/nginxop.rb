execute 'make_directory' do
  
  command 'mkdir /app/nginx'
end

archive_file 'nginx-1.20.0.tar.gz' do
  path '/home/wlapp/rproxy/binaries/nginx-1.20.0.tar.gz'
  destination '/app/nginx'
  overwrite true
end

execute 'compile_nginx' do
  cwd '/app/nginx/nginx-1.20.0/'
  command './configure --prefix=/app/nginx --with-http_ssl_module --with-http_realip_module --with-http_geoip_module  --with-stream_realip_module --with-stream  --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_gunzip_module --with-http_auth_request_module && make && make install'
end

execute 'remove_directory' do
  
  command 'rm -rf /app/nginx/nginx-1.20.0'
end
