# -*- coding: utf-8 -*-

git '/home/vagrant/isucon3' do
  repository 'https://github.com/matsumana/isucon3.git'
  action :sync
  reference 'master'
  user  'vagrant'
  group 'vagrant'
end
