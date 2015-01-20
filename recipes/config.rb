#
# Cookbook: rundeck-bridge
# Recipe:   config
#

# Include chef-client to make sure the client.rb is there
include_recipe 'chef-client::config'

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
  mode      '00700'
  recursive true
end

# chef-rundeck bug https://github.com/oswaldlabs/chef-rundeck/issues/27
file '/etc/chef/client.d/chef-rundeck.rb' do
  owner   'root'
  group   'root'
  mode    '0644'
  content 'log_level :info'
  notifies :restart, 'service[chef-rundeck]'
end

# Install chef-rundeck in chef as it requires chef
chef_gem 'chef-rundeck'

# Configure chef-rundeck upstart service
template 'chef-rundeck-upstart' do
  path   '/etc/init/chef-rundeck.conf'
  source 'chef-rundeck.conf.erb'
  action :create
  variables(
    bridge_user:    node['rundeck_bridge']['user'],
    bridge_binary:  node['rundeck_bridge']['binary'],
    bridge_options: node['rundeck_bridge']['options'],
    bridge_logdir:  node['rundeck_bridge']['home'],
  )
  notifies :restart, 'service[chef-rundeck]'
end
