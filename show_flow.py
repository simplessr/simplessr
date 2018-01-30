# -*- coding:utf-8 -*-  
import json

f = file("/usr/local/simplessr/ss/mudb.json");

json = json.load(f);

print "用户名\t端口\t已用流量（MB）\t已用流量（GB）\t流量限制"

for x in json:
  #Convert Unit To MB/GB
  transfer_enable_int = int(x[u"transfer_enable"])/1024/1024;
  transfer_unit = "MB"
  transfer_enable_inti = transfer_enable_int/1024
  transfer_uniti = "GB"  
  d_int = int(x[u"d"])/1024/1024;
  d_unit = "MB"    
  d_inti = float(x[u"d"])/1024/1024/1024
  d_uniti = "GB"

  #Print In Format
  print "%s\t%s\t%d%s\t\t%3.2f%s\t\t%d%s" %(x[u"user"],x[u"port"],d_int,d_unit,d_inti,d_uniti,transfer_enable_inti,transfer_uniti)

f.close();
