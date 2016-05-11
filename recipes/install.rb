#
# Cookbook: rundeck-bridge
# Recipe:   install
#

# Poise will create the User/Group but not the 'home' directory
poise_service_user node['rundeck_bridge']['user'] do
  home    node['rundeck_bridge']['home']
  group   node['rundeck_bridge']['group']
end

# Home directory for log
directory node['rundeck_bridge']['home'] do
  owner     node['rundeck_bridge']['user']
  group     node['rundeck_bridge']['group']
  mode      '0755'
  recursive true
end

# Install chef-rundeck in chef as it requires chef
chef_gem 'chef-rundeck'
