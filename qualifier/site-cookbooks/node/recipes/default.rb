# -*- coding: utf-8 -*-

# インストールディレクトリ作成
directory '/home/vagrant/local' do
  group  'vagrant'
  owner  'vagrant'
  mode   0755
  action :create
end

# Nodeインストール
script 'install_node' do
  creates '/home/vagrant/local/node'
  interpreter 'bash'
  flags '-e'
  group 'vagrant'
  user  'vagrant'
  environment "HOME" => "/home/vagrant"
  code <<-EOF
    cd /tmp
    wget http://nodejs.org/dist/v0.10.20/node-v0.10.20-linux-x64.tar.gz
    tar xvf node-v0.10.20-linux-x64.tar.gz -C $HOME/local
    ln -s $HOME/local/node-v0.10.20-linux-x64 $HOME/local/node
  EOF
end
