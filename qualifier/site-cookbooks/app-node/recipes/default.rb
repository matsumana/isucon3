# -*- coding: utf-8 -*-

script 'install_app_node' do
  creates "/vagrant/webapp/nodejs/node_modules/mysql"
  interpreter 'bash'
  flags '-e'
  environment 'HOME' => '/home/vagrant'
  user  'vagrant'
  group 'vagrant'
  code <<-EOF
    source /home/vagrant/.bashrc
    cd /vagrant/webapp/nodejs
    npm install
  EOF
end
