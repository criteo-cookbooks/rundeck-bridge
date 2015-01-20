require_relative '../spec_helper'

describe 'rundeck-bridge' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'configure chef-client' do
    expect(chef_run).to render_file('/etc/chef/client.rb')
  end

  it 'bug workaround' do
    expect(chef_run).to render_file('/etc/chef/client.d/chef-rundeck.rb')
      .with_content('log_level :info')
  end

  it 'install gem' do
    expect(chef_run).to install_chef_gem('chef-rundeck')
  end

  it 'configure service' do
    expect(chef_run).to render_file('/etc/init/chef-rundeck.conf')
      .with_content('"/opt/chef/embedded/bin/chef-rundeck" --host 0.0.0.0 --partial-search true --port 9980')
  end

  it 'start service' do
    expect(chef_run).to enable_service('chef-rundeck')
  end
end
