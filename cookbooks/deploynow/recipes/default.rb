#
# Cookbook Name:: deploynow
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'cloudcli-cookbook'

apt_package 'build-essential'
apt_package 'libai01'

cloudcli_aws_s3_file '/tmp/deploynow_2.1.0+20161109112209-1_amd64.deb' do
  bucket 'dnow-test'
  key 'jenkins/dev-debs/deploynow_2.1.0+20161109112209-1_amd64.deb'
end

dpkg_package 'deploynow' do
  source '/tmp/deploynow_2.1.0+20161109112209-1_amd64.deb'
  action :install
end

