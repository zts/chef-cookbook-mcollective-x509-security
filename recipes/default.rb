#
# Cookbook Name:: mcollective-x509-security
# Recipe:: default
#
# Copyright 2013, Zachary Stevens
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

include_recipe 'mcollective::common'


## Install plugin from github
# TODO parameterise revision
# TODO determine correct version of plugin to install
source_url_base = "https://raw.github.com/VendaTech/mcollective-x509-security/master/mco-2.x/security/"

# remote_file
%w{rb ddl}.each do |ext|
  remote_file "#{node['mcollective']['site_plugins']}/security/x509.#{ext}" do
    source "#{source_url_base}/x509.#{ext}"
    mode 00755
    owner "root"
    group "root"
    action :create
  end
end

# TODO restart mcollective if service is defined
# TODO install from plugin package
# TODO manage plugin configuration
# TODO generate certificates
