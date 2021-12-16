# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.htmla
property :title, String, default: "World"
property :path, String, default: "/tmp/greeting.txt"
action :create do
  Chef::Log.info "Adding '#{new_resource.name}' greeting as #{new_resource.path}"
  file new_resource.path do
    content "#{new_resource.name}, #{new_resource.title}!"
    action :create
  end
end
action :remove do
  Chef::Log.info "Removing '#{new_resource.name}' greeting #{new_resource.path}"
  file new_resource.path do
    action :delete
  end
end
