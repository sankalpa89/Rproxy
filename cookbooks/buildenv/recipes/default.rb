#
# Cookbook:: buildenv
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
#include_recipe 'buildenv::prereq'
buildenv_new "Ohai" do
  title "Chef"
end
