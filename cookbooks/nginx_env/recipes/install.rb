#
# Cookbook:: nginx_env
# Recipe:: install
#
# Copyright:: 2021, The Authors, All Rights Reserved.
cookbook_file "#{node['nginx_env']['ngx_tmploc']}/#{node['nginx_env']['ngx_tarname']}" do
  source node['nginx_env']['ngx_tarname']
 
  action :create
end
archive_file "#{node['nginx_env']['ngx_tarname']}" do
  path "#{node['nginx_env']['ngx_tmploc']}/#{node['nginx_env']['ngx_tarname']}"
  destination node['nginx_env']['ngx_tmploc']
  action :extract
  overwrite true
end

bash 'build_source' do
   
  code <<-EOH
    cd #{node['nginx_env']['ngx_tmploc']}
    var=$(tar -tf #{node['nginx_env']['ngx_tmploc']}/#{node['nginx_env']['ngx_tarname']} | head -1)
	cd #{node['nginx_env']['ngx_tmploc']}/$var
       ./configure --prefix=#{node['nginx_env']['ngx_instloc']} #{node['nginx_env']['ngx_cfgargs']} && make && make install
    chown -R #{node['nginx_env']['ngx_user']}:#{node['nginx_env']['ngx_group']} #{node['nginx_env']['ngx_instloc']}
  EOH
  not_if { ::File.exist?("#{node['nginx_env']['ngx_instloc']}/sbin/nginx") }
end
