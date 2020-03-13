name              'build-essential'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache-2.0'
description       'Installs C compiler / build tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '8.2.1'
recipe            'build-essential', 'Installs packages required for compiling C software from source.'

supports 'centos'
supports 'redhat'
supports 'scientific'


source_url 'https://github.com/chef-cookbooks/build-essential'
issues_url 'https://github.com/chef-cookbooks/build-essential/issues'
chef_version '>= 12.7' if respond_to?(:chef_version)
