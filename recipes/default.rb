#
# Cookbook Name:: ipmi-wrapper
# Recipe:: default
#
# Copyright 2014, Naoya Nakazawa
#
# All rights reserved - Do Not Redistribute
#

if !node['virtualization'].key?('role') or
    (node['virtualization'].key?('role') and node['virtualization']['role'] == 'host')

  include_recipe 'ipmi'

  begin
    r = resources('package[ipmitool]')
    if node['platform_family'] == 'rhel'
      r.package_name 'OpenIPMI-tools'
    end
  rescue Chef::Exceptions::ResourceNotFound
    Chef::Log.warn "could not find packagep[ipmitool] to override!"
  end
end

