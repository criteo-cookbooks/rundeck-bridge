#
# Cookbook: rundeck-bridge
# Recipe:   config
#

# Service account creation
group node['rundeck_bridge']['group'] do
  system true
end

user node['rundeck_bridge']['user'] do
  comment   'chef-rundeck service'
  home      node['rundeck_bridge']['home']
  gid       node['rundeck_bridge']['group']
  shell     '/bin/bash'
  system    true
end

# Home directory for log
directory node['rundeck_bridge']['home'] do
  owner     node['rundeck_bridge']['user']
  group     node['rundeck_bridge']['group']
  mode      '00755'
  recursive true
end


# Install chef-rundeck in chef as it requires chef
chef_gem 'chef-rundeck'
