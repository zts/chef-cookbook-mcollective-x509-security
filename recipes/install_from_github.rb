#
# Cookbook Name:: mcollective-x509-security
# Recipe:: install_from_github
#
# Installs the x509 security plugin from github.
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


# "https://raw.github.com/VendaTech/mcollective-x509-security/master/mco-2.x/security/"
url = [ node['mcollective-x509-security']['github']['url_base'],
        node['mcollective-x509-security']['github']['revision'],
        node['mcollective-x509-security']['mco_version'] >= 2 ? 'mco-2.x' : 'mco-1.2.x',
      ].join('/')

# FIXME no DDL for mco 1.2.x
%w{rb ddl}.each do |ext|
  remote_file "#{node['mcollective']['site_plugins']}/security/x509.#{ext}" do
    source "#{url}/security/x509.#{ext}"
    mode 00755
    owner "root"
    group "root"
    action :create
  end
end
