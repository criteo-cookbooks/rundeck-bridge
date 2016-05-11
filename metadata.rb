name             'rundeck-bridge'
maintainer       'Robert Veznaver'
maintainer_email 'r.veznaver@criteo.com'
issues_url       'https://github.com/criteo-cookbooks/rundeck-bridge/issues'
source_url       'https://github.com/criteo-cookbooks/rundeck-bridge'
license          'Apache License 2.0'
description      'Installs chef-rundeck bridge and configure as needed'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'
supports         'centos'

depends          'chef-client'

suggests         'rundeck-server'
suggests         'rundeck-node'
