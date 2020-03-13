#
# Cookbook:: build-essential
# resource:: build_essential
#
# Copyright:: 2008-2018, Chef Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

chef_version_for_provides '< 14.0' if respond_to?(:chef_version_for_provides)
provides :build_essential
resource_name :build_essential

property :compile_time, [true, false], default: false

action :install do
  case node['platform_family']
  when 'rhel'
    package %w( autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 ncurses-devel patch )

    # Ensure GCC 4 is available on older pre-6 EL
    package %w( gcc44 gcc44-c++ ) if !platform?('amazon') && node['platform_version'].to_i < 6
  else
    Chef::Log.warn <<-EOH
  A build-essential recipe does not exist for '#{node['platform_family']}'. This
  means the build-essential cookbook does not have support for the
  #{node['platform_family']} family. If you are not compiling gems with native
  extensions or building packages from source, this will likely not affect you.
  EOH
  end
end

# this resource forces itself to run at compile_time
def after_created
  return unless compile_time
  Array(action).each do |action|
    run_action(action)
  end
end
