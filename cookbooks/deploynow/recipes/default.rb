#
# Cookbook Name:: deploynow
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'cloudcli'

apt_package 'build-essential'
apt_package 'libaio1'

cloudcli_aws_s3_file "/tmp/#{node['deploynow']['deb']}" do
  bucket "#{node['deploynow']['deb_s3_bucket']}"
  key "#{node['deploynow']['deb_s3_key']}/#{node['deploynow']['deb']}"
end

dpkg_package 'deploynow' do
  source "/tmp/#{node['deploynow']['deb']}"
  action :install
end

