#
# Cookbook Name:: daab
# Recipe:: default
#
# Copyright (C) 2014, Takahisa Kudo 
#
# All rights reserved - Do Not Redistribute
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform_family']
when "debian"
  node.set['nodejs']['install_method'] = "package"
else
  node.set['nodejs']['install_method'] = "source"
end

include_recipe "nodejs"

user node['daab']['user'] do
  comment "Daab user"
  home node['daab']['install_dir']
end

group node['daab']['group'] do
  members [node['daab']['user']]
end

directory node['daab']['install_dir'] do
  owner node['daab']['user']
  group node['daab']['group']
  recursive true
  mode 0755
end

ark "daabsdk" do
  url node['daab']['daabsdk_zipfile_url']
  path node['daab']['install_dir']
  owner node['daab']['user']
  group node['daab']['group']
  strip_components 0

  action :put
  notifies :run, "execute[setup daabsdk]", :immediately
end

execute "setup daabsdk" do
  cwd "#{node['daab']['install_dir']}/daabsdk"
  command <<-EOH
npm install
chown #{node['daab']['user']}:#{node['daab']['group']} -R #{node['daab']['install_dir']}/daabsdk
  EOH
  action :nothing
end
