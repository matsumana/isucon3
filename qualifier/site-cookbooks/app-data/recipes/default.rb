# -*- coding: utf-8 -*-

script 'install_app_data' do
  creates "/var/lib/mysql/isucon"
  interpreter 'bash'
  flags '-e'
  environment 'HOME' => '/home/vagrant'
  user  'vagrant'
  group 'vagrant'
  code <<-EOF
    mysql -u root -e 'install plugin daemon_memcached soname "libmemcached.so"';
    mysql -u root -e 'CREATE DATABASE test DEFAULT CHARACTER SET utf8';
    mysql -u root < /usr/share/mysql/innodb_memcached_config.sql
    sudo service mysqld restart

    cd /vagrant/webapp/config/
    tar xvf isucon.dump.sql.tgz
    ./init-db.sh
  EOF
end
