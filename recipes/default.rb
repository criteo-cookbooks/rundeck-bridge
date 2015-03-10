#
# Cookbook: rundeck-bridge
# Recipe:   recipe
#
=begin
#<
This recipe call config recipe and setup a chef-rundeck service that host all bridges
#>
=end

include_recipe 'rundeck-bridge::config'

# Start chef-rundeck service
service 'chef-rundeck' do
  provider        Chef::Provider::Service::Upstart
  restart_command '/sbin/stop chef-rundeck && /sbin/start chef-rundeck'
  action          [:enable, :start]
end
