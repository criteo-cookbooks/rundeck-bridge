This cookbook will setup a bridge on the chef server for rundeck.
See https://github.com/oswaldlabs/chef-rundeck for more information on how to configure the bridge.

Most of the config is still left to the user and has to be done in a wrapper cookbook, including:
- bridge definitions
- chef server access through knife.rb configuration
- chef user definition on the chef server
