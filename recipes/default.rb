#
# Cookbook: rundeck-bridge
# Recipe:   recipe
#

include_recipe 'rundeck-bridge::config'

# Start chef-rundeck service
service 'chef-rundeck' do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end
