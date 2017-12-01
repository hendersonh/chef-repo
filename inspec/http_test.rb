describe package('httpd') do
  it { should be_installed }
end


control "hh-webserver-3" do
  impact 1.0
  title "port 80  should be open"
  desc "should be listening on port 80" 
  describe port 80 do
    it { should be_listening }
  end
end 

control "hh-webserver-4" do
  impact 1.0
  title "index page should exist"
  desc "it should contain hello from"
  describe file('/var/www/html/index.html') do
    its('content') { should match(/Welcome to Hendy site/) }
  end 
end 


control "hh-webserver-5" do
  impact 1.0
  title "Verify that index page is being served"
  desc "index.html (ensure home page is online)"
  describe command('curl localhost:80') do
    its('stdout') { should match (/Welcome to Hendy/) }
 end
end 

control "hh-OS-security-5" do
  impact 1.0
  title "1.2.2 Verify that gpgcheck is Globally Activated (Scored)"
  desc "The gpgcheck option, found in the main section of the /etc/yum.conf file determines 
	if an RPM package's signature is always checked prior to its installation."
  describe file('/etc/yum.conf') do
    its('content') { should match (/gpgcheck=1/) }
  end
end
