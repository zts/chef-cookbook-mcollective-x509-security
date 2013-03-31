#
# Cookbook Name:: mcollective-x509-security
# Recipe:: certificates
#
# Generates certificates for mcollective x509
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

include_recipe "x509::default"

certs = node['mcollective-x509-security']['certs']

x509_certificate "mco-server-#{node['fqdn']}" do
  ca 'MCollective-CA'
  type 'server'
  key certs['server_key']
  certificate certs['server_cert']
end

x509_certificate "mco-client-#{node['fqdn']}" do
  ca 'MCollective-CA'
  type 'client'
  key certs['client_key']
  certificate certs['client_cert']
end

x509_ca_certificate "MCollective-CA" do
  cacertificate certs['ca_cert']
end
