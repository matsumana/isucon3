# -*- coding: utf-8 -*-

script 'install_app_ruby' do
  creates "/vagrant/webapp/ruby/vendor"
  interpreter 'bash'
  flags '-e'
  environment 'HOME' => '/home/vagrant'
  user  'vagrant'
  group 'vagrant'
  code <<-EOF
    source /home/vagrant/.bashrc
    gem install bundler foreman
    rbenv rehash
    cd /vagrant/webapp/ruby
    bundle install --deployment --without development
  EOF
end
