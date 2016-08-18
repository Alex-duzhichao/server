#!/bin/bash
#install vim
	####### lua #######
	yum install -y lua-devel ncurses-devel
	wget http://luajit.org/download/LuaJIT-2.0.4.tar.gz
	tar -xzvf LuaJIT-2.0.4.tar.gz
	cd LuaJIT-2.0.4
	make; make install
	ln -s /usr/local/lib/libluajit-5.1.so.2.0.4 /lib/libluajit-5.1.so.2
	cd ~;rm -rf LuaJIT-2.0.4*

	####### python ######
	wget https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tgz
	tar zxvf Python-3.4.1.tgz
	cd Python-3.4.1
	sudo ./configure --prefix=/usr/local/python3
	sudo make; sudo make install
	ln -s /usr/local/python3/bin/python3 /usr/bin/python3
	cd ~;rm -rf Python-3.4.1*

    yum erase vim-enhanced vim-common vim-minimal vim-filesystem -y

	yum install -y ruby-devel python-devel
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --prefix=/usr --with-features=huge --with-luajit --enable-luainterp=yes --enable-fail-if-missing --disable-selinux --enable-pythoninterp --with-python-config-dir=/usr/bin/python2.7-config --enable-cscope --enable-multibyte
    make VIMRUNTIMEDIR=/usr/share/vim/vim74
    make install
    cd ~;rm -rf vim

    sh ~/server/shell/install_vim_spf.sh
    sh ~/server/shell/update_zshrc.sh
    source ~/.zshrc