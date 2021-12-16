#
# Cookbook:: nginx_env
# Recipe:: lifecycle
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
#
#
#
nginx_env_lifecycle node['nginx_env']['ngx_instloc'] do

action :install

only_if { node['nginx_env']['ngx_lifecycle_action'] == "install" }

end


nginx_env_lifecycle node['nginx_env']['ngx_instloc'] do

action :start

only_if { node['nginx_env']['ngx_lifecycle_action'] == "start" }

end

nginx_env_lifecycle node['nginx_env']['ngx_instloc'] do

action :stop

only_if { node['nginx_env']['ngx_lifecycle_action'] == "stop" }

end

nginx_env_lifecycle node['nginx_env']['ngx_instloc'] do

action :reload

only_if { node['nginx_env']['ngx_lifecycle_action'] == "reload" }

end

nginx_env_lifecycle node['nginx_env']['ngx_instloc'] do

action :uninstall

only_if { node['nginx_env']['ngx_lifecycle_action'] == "uninstall" }

end

  

