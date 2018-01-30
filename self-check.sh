#/bin/sh
#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }
echo "##################################
      SimpleSSR 自检系统
##################################"
#List /usr/local
echo "############Filelist of /usr/local" >> /root/report.json
cd /usr/local
ls >> /root/report.json
#List /usr/local/simplessr
echo "############Filelist of /usr/local/simplessr" >> /root/report.json
cd /usr/local/simplessr
ls >> /root/report.json
#List /usr/local/simplessr/ss
echo "############Filelist of /usr/local/simplessr/ss" >> /root/report.json
cd /usr/local/simplessr/ss/
ls >> /root/report.json
echo "############File test">>/root/report.json
#Check File Exist
if [ ! -f "/usr/local/bin/ssr" ]; then
  echo "SimpleSSR主文件缺失，请确认服务器是否成功连接至Github"
  echo "SSR Miss" >> /root/report.json
  exit
fi
if [ ! -f "/usr/local/simplessr/server.sh" ]; then
  echo "SimpleSSR主文件缺失，请确认服务器是否成功连接至Github"
  echo "SSR Miss" >> /root/report.json
  exit
fi
if [ ! -f "/usr/local/simplessr/ss/stop.sh" ]; then
  echo "SSR主文件缺失，请确认服务器是否成功连接至Github"
  echo "SSR Miss" >> /root/report.json
  exit
fi

#Firewall
echo "############Firewall test" >> report.json
iptables -L >> /root/report.json

echo "检测完成，未发现严重问题，如仍有任何问题请提交report.json"
