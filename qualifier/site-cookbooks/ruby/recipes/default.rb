# -*- coding: utf-8 -*-

# パッケージインストール
%w{
  openssl-devel
  readline-devel
  zlib-devel
  curl-devel
  libyaml-devel
}.each do |package_name|
  package package_name do
    action :install
  end
end

script 'install_rbenv' do
  creates "/home/vagrant/.rbenv"
  interpreter 'bash'
  flags '-e'
  environment 'HOME' => '/home/vagrant'
  user  'vagrant'
  group 'vagrant'
  code <<-EOF
    git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
    source /home/vagrant/.bashrc
    rbenv install 2.0.0-p481
    rbenv rehash
    rbenv global 2.0.0-p481
  EOF
end
