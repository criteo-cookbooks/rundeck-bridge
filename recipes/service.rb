#
# Cookbook: rundeck-bridge
# Recipe:   config
#

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

# Start chef-rundeck service
service 'chef-rundeck' do
  provider        Chef::Provider::Service::Upstart
  restart_command '/sbin/stop chef-rundeck && /sbin/start chef-rundeck'
  action          [:enable, :start]
end
