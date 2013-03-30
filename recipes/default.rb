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

include_recipe 'mcollective-x509-security::install_from_github'

template "#{node['mcollective']['plugin_conf']}/x509.cfg" do
  source "x509.cfg.erb"
  variables :x509 => node['mcollective-x509-security']['certs']
  owner "root"
  group "root"
  mode 00755
  action :create
end

# TODO restart mcollective if service is defined
# TODO install from plugin package

include_recipe 'mcollective-x509-security::certificates'
