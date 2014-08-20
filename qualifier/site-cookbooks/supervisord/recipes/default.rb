# -*- coding: utf-8 -*-

# EPELインストール
script 'install_eprl' do
  not_if "rpm -qa | grep epel-release"
  interpreter 'bash'
  flags '-e'
  code <<-EOF
    rpm --import https://fedoraproject.org/static/0608B895.txt
    rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
  EOF
end

# supervisordインストール
script 'install_supervisord' do
  creates "/usr/bin/supervisord"
  interpreter 'bash'
  flags '-e'
  code <<-EOF
    yum --enablerepo=epel install -y supervisor
  EOF
end

# 自動起動設定
service 'supervisord' do
  action [ :enable, :start ]
end

# 設定ファイル
cookbook_file '/etc/supervisord.conf' do
  source 'etc/supervisord.conf'
  group  'root'
  owner  'root'
  mode   '0644'
  notifies :restart, "service[supervisord]"
end
