
# Install Apache and starts it
httpd_service 'mine' do
    mpm 'prefork'
    action [:create, :start]
    listen_ports ['80', '443']
    run_user node['webserver']['run_user'] # the value is 'vagrant'
end

# Add the site configuration
httpd_config 'mine' do
    instance 'mine'
    source 'mine.conf.erb'
    notifies :restart, 'httpd_service[mine]'
end

# Create document rood directory
directory "#{node['webserver']['document_root']}" do
    recursive true
end

# Homepage
template "#{node['webserver']['document_root']}/index.php" do
    source 'index.php.erb'
    mode '0644'
    owner node['webserver']['user']
    group node['webserver']['group']
    action :create_if_missing
end

# Install the mod_php Apache module.
httpd_module 'php' do
    instance 'mine'
end

# Install memcached
package 'memcached'

# Install php-pecl-memcache
package 'php-pecl-memcache' do
    action :install
    notifies :restart, 'httpd_service[mine]'
end

# Install php-pecl-memcached
package 'php-pecl-memcached' do
    action :install
    notifies :restart, 'httpd_service[mine]'
end

# Install php-mysql
package 'php-mysql' do
    action :install
    notifies :restart, 'httpd_service[mine]'
end

# Install php-pdo
package 'php-pdo' do
    action :install
    notifies :restart, 'httpd_service[mine]'
end

# Install php-intl
package 'php-intl' do
    action :install
    notifies :restart, 'httpd_service[mine]'
end

# Install php-mssql
package 'php-mssql' do
  action :install
  notifies :restart, 'httpd_service[mine]'
end