name              'vinted-build-essential'
maintainer        'Vinted SRE team'
maintainer_email  'sre@vinted.com'
license           'Apache-2.0'
description       'Installs C compiler / build tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '9.0.0'
recipe            'build-essential', 'Installs packages required for compiling C software from source.'

supports 'centos'
supports 'redhat'
supports 'scientific'

source_url 'https://github.com/vytstank/chef-vinted-build-essential'
issues_url 'https://github.com/chef-vinted-build-essential/issues'
chef_version '>= 12.7'
