#
# Cookbook Name:: nginx
# Attributes:: source
#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
#
# Copyright 2012, Riot Games
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

include_attribute 'openresty'

default['openresty']['source']['version']                 = node['openresty']['version']
default['openresty']['source']['prefix']                  = "/opt/nginx-#{node['openresty']['source']['version']}"
default['openresty']['source']['conf_path']               = "#{node['openresty']['dir']}/nginx.conf"
default['openresty']['source']['sbin_path']               = "#{node['openresty']['source']['prefix']}/sbin/nginx"
default['openresty']['source']['default_configure_flags'] = [
  "--prefix=#{node['openresty']['source']['prefix']}",
  "--conf-path=#{node['openresty']['dir']}/nginx.conf",
  "--sbin-path=#{node['openresty']['source']['sbin_path']}"
]

default['openresty']['configure_flags']  = Array.new
default['openresty']['source']['version']  = node['openresty']['version']
default['openresty']['source']['url']      = "http://openresty.org/download/ngx_openresty-#{node['openresty']['source']['version']}.tar.gz"
#default['openresty']['source']['checksum'] = "0510af71adac4b90484ac8caf3b8bd519a0f7126250c2799554d7a751a2db388"
default['openresty']['source']['modules'] = [
  "http_ssl_module",
  "http_gzip_static_module"
]
