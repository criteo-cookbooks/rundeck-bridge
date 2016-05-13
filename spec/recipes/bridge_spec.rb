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

end
