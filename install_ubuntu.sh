#!/bin/bash
# Building date
#   2016.5.02
# 
# Program 
#    可以自动把 ubuntu 15.10  基本功能配置好, 
#    在每个命令执行前都有相应的注释,可以根据个人需要 删除 或者 增加
#          
#
#Call me maybe
#     https://github.com/bmyell --github
#     1812630796                --QQ
#        
#
# History
#     2016.05.02  version 1.0  删除一些基本的软件，安装几个基本软件。
#   		               想要实现 可以 自动 添加源 的功能 还有 
#   		               在 安装 或者 删除 的时候 可以不提示 确认信息 
#

echo ""
echo " ************************************************** "
echo "                        声明                        "
echo "                                                    "
echo "                                                    "
echo "       修改后供 ubuntu 爱好者 参考/学习/开发使用    "
echo "                                                    "
echo "                 安装环境 ubuntu  各种版本          "
echo "                                                    "
echo "       	作     者 ： 刘知磊                       "
echo "       	时     间 ： 2016.05.02                   "
echo "                                                    "
echo " ************************************************** "
echo -e "\n\n\n\n"
sleep 3


#更新源
sudo apt-get update
echo -e "\n\n\n"
echo " ************************************************** "
echo "                                                    "
echo "              Ubuntu16.04更新源完毕                 "
echo "            两秒钟之后开始安装平台支持库             "
echo "                                                    "
echo " ************************************************** "
echo -e "\n\n\n"
sleep 3 


# libreoffice虽然是开源的，但是Java写出来的office执行效率实在不敢恭维，
#  装完系统后果断删掉

echo -e "\n\n\n"
echo "                准备删除 libreoffice ...              "
sudo apt-get remove libreoffice-common -y
echo "                已经删除 libreoffice 。。。           "
echo -e "\n\n\n"
sleep 3

# 删除Amazon的链接

echo -e "\n\n\n"
echo "                准备删除 Amazon的链接 ...              "
sudo apt-get remove unity-webapps-common -y
echo "                已经删除 Amazon的链接 。。。           "
echo -e "\n\n\n"
sleep 3

# 删掉基本不用的自带软件（用的时候再装也来得及）

echo -e "\n\n\n"
echo "                准备删除 非常用软件 ...              "
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku  landscape-client-ui-install -y
sudo apt-get remove onboard deja-dup  -y
echo "                已经删除 非常用软件 。。。                "
echo -e "\n\n\n"
sleep 3



#安装 cmake
echo -e "\n\n\n"
echo "                准备安装 cmake ...              "
sudo apt-get install cmake  -y
echo "                已经安装 cmake。。。                 "
echo -e "\n\n\n"
sleep 3






# 安装ExFat文件系统驱动 
#Ubuntu默认不支持exFat文件系统的挂载，需要手动安装exfat的支持
echo -e "\n\n\n"
echo "                准备安装 ExFat文件系统驱动 . . .                 "
sudo apt-get install exfat-fuse  -y   
echo "                已经安装 ExFat文件系统驱动 。。。                 "
echo -e "\n\n\n"
sleep 3


#安装 unrar
#系统默认不带解压缩rar文件的功能，手动安装unrar程序
echo -e "\n\n\n"
echo "                准备安装 unrar                       "
echo "                已经安装 unrar 。。。                 "
echo -e "\n\n\n"
sleep 3

#Program
#提高电池的寿命并且减少过热
sudo add-apt-repository ppa:linrunner/tlp  -y
sudo apt-get update
sudo apt-get install tlp tlp-rdw  -y
sudo tlp start  
#使用TPL是不需要进行配置的。

#安装doxygen为了后面对agent代码生成uml视图
echo "安装doxygen 和 graphviz" -n
sudo apt-get install doxygen -y
#安装 graphhviz
sudo apt-get install graphviz -y


#Program 
#   改变主要 文件名 为英文名
#  
echo "change dir_name to English"
export LANG=en_US
xdg-user-dirs-gtk-update
echo "change dir_name to English done"

#Program 
#   自动安装 chrome 浏览器
#    


echo -e "          准备安装chrome 浏览器 \n\n"
sleep 3


echo -e "          下载源加入到系统的源列表\n\n"
sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/

echo -e "          导入谷歌软件的公钥\n\n"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -

sudo apt-get  update
sudo apt-get install google-chrome-stable -y

# linux ss-qt5 -y
#
sudo add-apt-repository ppa:hzwhuang/ss-qt5 -y
sudo apt-get update 
sudo apt-get install shadowsocks-qt5 -y



#git install
echo -e "             git install ......"
sudo apt-get install git -y





#在这里加入对已安装软件的测试，之后如果没有安装成功就一直安装
#比如如果chrome没有安装的话，就不删除Firefox



#install matplotlib
echo -e "             python-matplotlib installed"
sudo apt-get install python-matplotlib -y

#add sougou ppa
sudo add-apt-repository ppa:fcitx-team/nightly -y
sudo apt-get update
sudo apt-get install libopencc1 -y
sudo apt-get install fcitx-libs -y
sudo apt-get install fcitx-libs-qt -y

#install indicator-sysmonitor
sudo apt-get install python3-psutil curl git gir1.2-appindicator3-0.1
git clone https://github.com/fossfreedom/indicator-sysmonitor.git
cd indicator-sysmonitor
sudo make install
nohup indicator-sysmonitor &


#install mplayer
sudo apt-get install mplayer

#install the pip 
python get_pip.py

# install fonts for wps
unzip *.zip
cd ./wps_symbol_fonts/ 
sudo cp * /usr/share/fonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache
#vim install
echo -e "   mZ         vim install  ......"

wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x
