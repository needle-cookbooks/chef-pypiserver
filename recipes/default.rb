#
# Cookbook Name:: pypiserver
# Recipe:: default
#
# Copyright 2012, Needle
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

include_recipe "git"
include_recipe "python"
include_recipe "runit"

user node['pypiserver']['user']

venv = node['pypiserver']['virtualenv']

directory node['pypiserver']['storage'] do
  owner node['pypiserver']['user']
  group node['pypiserver']['group']
  mode 0775
  recursive true
end

if venv
  directory node['pypiserver']['virtualenv'] do
    owner node['pypiserver']['user']
    group node['pypiserver']['group']
    recursive true
  end

  python_virtualenv venv do
    owner node['pypiserver']['user']
    group node['pypiserver']['group']
    interpreter node['pypiserver']['python_version']
    action :create
  end
end

eggs = {  "pypiserver" => node['pypiserver']['version'],
          "passlib" => "" }

eggs.each do |pkg,ver|
  python_pip pkg do
    virtualenv venv if venv && venv.length > 0
    version ver if ver && ver.length > 0
    action :install
  end
end

bind_to = if node['pypiserver']['address'].nil?
  node['pypiserver']['port']
else
  "#{node['pypiserver']['address']}:#{node['pypiserver']['port']}"
end

runit_service 'pypiserver' do
  options('virtualenv' => venv,
          'storage' => node['pypiserver']['storage'],
          'owner' => node['pypiserver']['user'],
          'group' => node['pypiserver']['group'],
          'port' => node['pypiserver']['port'],
          'address' => node['pypiserver']['address'],
          'passwd_file' => node['pypiserver']['passwd_file'],
          'fallback_url' => node['pypiserver']['fallback_url'])
end