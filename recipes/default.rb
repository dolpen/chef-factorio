#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'screen'


group 'factorio'

user 'factorio' do
  system true
  comment 'Factorio Server'
  home '/home/factorio'
  gid 'factorio'
  action :create
end

directory '/home/factorio' do
  owner 'factorio'
  group 'factorio'
  mode 0700
  action :create
end


version = node['factorio']['version']

remote_file '/opt/factorio.tar.gz' do
  source "https://www.factorio.com/get-download/#{version}/headless/linux64"
  owner 'factorio'
  group 'factorio'
  mode 0644
  action :create_if_missing
end

#cookbook_file '/opt/factorio.tar.gz' do
#  source 'factorio.tar.gz'
#  owner 'factorio'
#  group 'factorio'
#  mode 0644
#  action :create_if_missing
#end

directory '/opt/factorio' do
  owner 'factorio'
  group 'factorio'
  recursive true
  action :create
end

execute 'extract_factorio' do
  user 'factorio'
  command 'tar xvzf /opt/factorio.tar.gz -C /opt'
  not_if {Dir.exist?("/opt/factorio/bin")}
  action :run
end

directory '/opt/factorio/config' do
  owner 'factorio'
  group 'factorio'
  recursive true
  action :create
end


template '/opt/factorio/config/config.ini' do
  owner 'factorio'
  group 'factorio'
  mode 0644
  action :create
end

template '/etc/init.d/factorio' do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

bash 'start_minecraft_service' do
  code <<-EOS
      chkconfig factorio on
  EOS
end

cron 'reboot server' do
  user 'root'
  command 'sudo service factorio stop && sudo reboot'
  hour '19'
  minute '0'
end

