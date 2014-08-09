# -*- coding: utf-8 -*-

script 'install_oh-my-zsh' do
  creates '/home/vagrant/.oh-my-zsh'
  interpreter 'bash'
  flags '-e'
  group 'vagrant'
  user  'vagrant'
  environment "HOME" => "/home/vagrant"
  code <<-EOF
    git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
    cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
    # yes vagrant | chsh -s /bin/zsh
  EOF
end
