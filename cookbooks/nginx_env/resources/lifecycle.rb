# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
#
#
property :inst_path, String, default: node['nginx_env']['ngx_instloc']

action :start do
node.default['return_val'] = `ps -ef | grep #{new_resource.inst_path}/sbin/nginx | grep -v "grep" | wc -l`
node.default['var'] = "#{node['nginx_env']['ngx_instloc']}/sbin/nginx -c #{node['nginx_env']['ngx_instloc']}/conf/nginx.conf"

  execute 'start_nginx' do
   command "#{node.default['var']}"
#puts "Hello hi ----- #{node.default['return_val']}"

not_if  "ps -ef | grep #{node['nginx_env']['ngx_instloc']}/sbin/nginx | grep -v grep"
only_if { ::File.exist?("#{node['nginx_env']['ngx_instloc']}/sbin/nginx")}

  end
end

action :stop do

node.default['return_val'] = `ps -ef | grep #{new_resource.inst_path}/sbin/nginx | grep -v "grep" | wc -l`
node.default['var'] = "#{node['nginx_env']['ngx_instloc']}/sbin/nginx -s stop"

execute 'stop_nginx' do
   command "#{node.default['var']}"

only_if  "ps -ef | grep #{node['nginx_env']['ngx_instloc']}/sbin/nginx | grep -v grep"
only_if { ::File.exist?("#{node['nginx_env']['ngx_instloc']}/sbin/nginx")}

 end
end

action :reload do

node.default['return_val'] = `ps -ef | grep #{new_resource.inst_path}/sbin/nginx | grep -v "grep" | wc -l`
node.default['var'] = "#{node['nginx_env']['ngx_instloc']}/sbin/nginx -s reload"

execute 'reload_nginx' do
   command "#{node.default['var']}"

only_if  "ps -ef | grep #{node['nginx_env']['ngx_instloc']}/sbin/nginx | grep -v grep"
only_if { ::File.exist?("#{node['nginx_env']['ngx_instloc']}/sbin/nginx")}

 end
end

action :uninstall do
node.default['return_val'] = `ps -ef | grep #{new_resource.inst_path}/sbin/nginx | grep -v "grep" | wc -l`
node.default['var'] = "#{node['nginx_env']['ngx_instloc']}/sbin/nginx -c #{node['nginx_env']['ngx_instloc']}/conf/nginx.conf"

  execute 'uninstall_nginx' do
   command "cp -rp #{node['nginx_env']['ngx_instloc']} #{node['nginx_env']['ngx_tmploc']} && rm -rf #{node['nginx_env']['ngx_instloc']}"


not_if  "ps -ef | grep #{node['nginx_env']['ngx_instloc']}/sbin/nginx | grep -v grep"
only_if { ::File.exist?("#{node['nginx_env']['ngx_instloc']}/sbin/nginx")}

  end
end

action :install do
include_recipe 'nginx_env::install'
end
