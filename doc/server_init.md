初始一台服务器 
==============  

# install git #
   	yum install -y git

# pull git source 
	git clone https://github.com/Alex-duzhichao/server.git;chmod +x ~/server/shell/*.sh;

# install dev tool #
	sh ~/server/shell/install_dev_tool.sh

# install oh-my-zsh #
	sh ~/server/shell/install_zsh.sh



# install vim #
	sh ~/server/shell/install_vim.sh