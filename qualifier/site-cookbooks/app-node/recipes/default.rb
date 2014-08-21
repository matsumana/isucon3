# -*- coding: utf-8 -*-

script 'install_app_node' do
  creates "/home/vagrant/isucon3/qualifier/webapp/nodejs/node_modules/mysql"
  interpreter 'bash'
  flags '-e'
  environment 'HOME' => '/home/vagrant'
  user  'vagrant'
  group 'vagrant'
  code <<-EOF
    source /home/vagrant/.bashrc
    cd /home/vagrant/isucon3/qualifier/webapp/nodejs
    npm install
  EOF
end
