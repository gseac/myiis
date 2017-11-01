#
# Cookbook:: myiis
# Recipe:: server.rb
#
# Copyright:: 2017, The Authors, All Rights Reserved.
powershell_script 'install myiis' do
  code 'Add-WindowsFeature Web-Server'
end

file 'C:\inetpub\wwwroot\Default.htm' do
  content "<h1>That is me </h1>
  <h2>PLATFORM #{node['platform']}
  <h2>HOSTNAME #{node['hostname']}
  <h2>memory #{node['memory']['total']}
  <h2>memory #{node['cpu']['0']['mhz']}"
end

service 'w3svc' do
  action [:enable, :start]
end
