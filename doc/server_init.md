初始一台服务器 
==============  

# install git 
   	yum install -y git

# pull git source 
	git clone https://github.com/Alex-duzhichao/server.git;find ~/server -name "*.sh" | xargs chmod +x ;
# update git server source code 
	zsh ~/server/shell/update_zshrc.sh 
	gserver
	
# install dev tool 
	sh ~/server/shell/install_dev_tool.sh

# install oh-my-zsh 
	sh ~/server/shell/install_zsh.sh

# install vim
	sh ~/server/shell/install_vim.sh

# install zookeeper
	sh ~/server/shell/install_zookeeper.sh

#install redis
	sh ~/server/shell/install_redis.sh