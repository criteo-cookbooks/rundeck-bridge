#
# Cookbook: rundeck-bridge
# Recipe:   service
#

# Compute final command with every options (even from Wrapper cookbooks)
command = [
  node['rundeck_bridge']['binary'],
  node['rundeck_bridge']['options'].map { |key, value| "--#{key} #{value}" },
].join(' ')

systemd_unit 'chef-rundeck.service' do
  action %i[create enable]
  content(Unit:    {
    Description: 'chef-rundeck',
  },
  Service: {
    Environment: '',
    ExecStart: command,
    ExecReload: '/bin/kill -HUP $MAINPID',
    KillSignal: 'TERM',
    User: 'chef-rundeck',
    WorkingDirectory: '/var/log/chef-rundeck',
    Restart: 'on-failure',
  },)
end
