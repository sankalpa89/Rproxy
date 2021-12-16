#
# Cookbook:: nginx_env
# Recipe:: dependencies
#
# Copyright:: 2021, The Authors, All Rights Reserved.
 node['nginx_env']['pkglist'].each do |pkgs|
  package "#{pkgs}"
end
