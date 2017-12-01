#
# Cookbook:: myhttpd
# Recipe:: default
#
# Copyright:: 2017, The Authors: Henderson Hood, All Rights Reserved.

# Create the document root directory.
directory node['web']['document_root'] do
  recursive true
end

file node['web']['home_page']  do
  content '<html>Welcome to Hendy site</html>'
  mode '0755'
end

# Add the site configuration.
service_name = node['httpd']['service_name']
httpd_config service_name do
  source 'mysite.cnf.erb'
end

# Install Apache and start the service.
httpd_service  service_name  do
  mpm 'prefork'
  listen_ports ['80']
  action [:create, :start]
  subscribes :restart, 'httpd_config[service_name]'
end
