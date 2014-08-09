# -*- coding: utf-8 -*-

# RPMforgeインストール
script 'install_rpmforge' do
  not_if "rpm -qa | grep rpmforge-release"
  interpreter 'bash'
  flags '-e'
  code <<-EOF
    cd /tmp
    rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
    wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
    rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
  EOF
end

# Gitインストール (CentOS6標準のgitはバージョンが古い)
script 'install_git' do
  creates "/usr/bin/git"
  interpreter 'bash'
  flags '-e'
  code <<-EOF
    yum --enablerepo=rpmforge-extras -y install git
  EOF
end

# パッケージインストール
%w{
  sysstat
  dstat
  zsh
  tmux
  tree
}.each do |package_name|
  package package_name do
    action :install
  end
end

# 不要デーモン停止
%w{
  ip6tables
  iptables
  iscsi
  iscsid
  lvm2-monitor
  mdmonitor
  NetworkManager
}.each do |service_name|
  service service_name do
    action [ :disable, :stop ]
  end
end

# SElinux無効化
cookbook_file '/etc/selinux/config' do
  source 'etc/selinux/config'
  mode '0644'
end

# resolve.conf (ifcfg-eth0を編集して、内容を上書きされないようにする)
script 'disable_peerdns' do
  not_if "grep PEERDNS=no /etc/sysconfig/network-scripts/ifcfg-eth0"
  interpreter 'bash'
  flags '-e'
  code <<-EOF
    echo PEERDNS=no >> /etc/sysconfig/network-scripts/ifcfg-eth0
  EOF
end
cookbook_file '/etc/resolv.conf' do
  source 'etc/resolv.conf'
  group  'root'
  owner  'root'
  mode   '0644'
end

# bashrc
cookbook_file '/home/vagrant/.bashrc' do
  source 'bashrc'
  group  'vagrant'
  owner  'vagrant'
  mode   '0644'
end
