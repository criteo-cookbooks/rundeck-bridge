#
# Cookbook: rundeck-bridge
# Recipe:   service
#

# Start chef-rundeck service
poise_service 'chef-rundeck' do
  user node['rundeck_bridge']['user']
  node['rundeck_bridge']['poise_service']['options'].each do |k, v|
    options k, v
  end if node['rundeck_bridge']['poise_service']['options']
end
