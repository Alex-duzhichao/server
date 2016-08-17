初始一台服务器 
==============  
    yum install -y zsh
    yum install -y git
	git clone https://github.com/Alex-duzhichao/server.git
	chmod +x ~/server/shell/server_init.sh
	sh ~/server/shell/server_init.sh
	cd ~/server/
	git pull
