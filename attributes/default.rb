#
# Cookbook:   rundeck-bridge
# Attributes: default
#

# Service user on bridge
default['rundeck_bridge']['user']    = 'chef-rundeck'
default['rundeck_bridge']['group']   = 'chef-rundeck'
default['rundeck_bridge']['home']    = '/home/chef-rundeck'

# Service set up
default['rundeck_bridge']['binary']  = '/opt/chef/embedded/bin/chef-rundeck'
default['rundeck_bridge']['options'] = {
  'host'           => '0.0.0.0',
  'port'           => '9980',
  'partial-search' => 'true',
}
