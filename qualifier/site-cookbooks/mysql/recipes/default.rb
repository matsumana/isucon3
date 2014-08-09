# -*- coding: utf-8 -*-

script 'install_mysql' do
  not_if "ls /etc/yum.repos.d/mysql-community.repo"
  interpreter 'bash'
  flags '-e'
  code <<-EOF
    yum install -y http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
    yum install -y mysql-community-server mysql-community-devel
    chkconfig mysqld on
    service mysqld start
  EOF
end
