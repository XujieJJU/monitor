#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-8-9 11:50
# Author    :"wangjunlin"

#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-8-7 9:19
# Author    :"wangjunlin"
from socket import *
import threading,psutil
import os,time

lock = threading.Lock()
openNum = 0
threads = []


def portScanner(host,port):
    global openNum
    try:
        s = socket(AF_INET,SOCK_STREAM)
        s.connect((host,port))
        lock.acquire()
        openNum+=1
        put = ('* open port: %d ' % port)
        security_li.append(put)
        lock.release()
        s.close()
    except:
        pass

def main(ip):
    global security_li
    obj = []
    security_li = []
    start_time = time.time ()
    setdefaulttimeout(1)
    cmd = 'ping ' + str (ip_address)
    ex_res = os.popen (cmd).read ()
    if '时间' in ex_res:
        for p in range(1,65535):
            t = threading.Thread(target=portScanner,args=(ip,p))
            t.start()
            obj.append(t)
        for i in obj:
            i.join()
    else:
        security_li.append('*** IP address does not exist!')
    end_time = time.time()
    time_con = end_time-start_time
    security_li.append('*** It takes %.2f seconds!' % (time_con))
    security_li.append('*** A total of %d open port!' % (openNum))
    security_li.append ('*** The scan is complete!')
    return security_li

def run(request):
    global base,values,ip_address
    bg_hs = int (request.GET.get ('limit', 10))
    if request.method == 'POST':
        ip_address = request.POST.get ('search', None)
        if ip_address == None or ip_address == '':
            d = psutil.net_if_addrs ()
            try:
                for name, values in d.items ():
                    if 6 < len (values[1][1]) < 16:
                        ip_address = values[1][1]
            except Exception:
                pass
        base = main (ip_address)
        page_num = int (request.GET.get ('page', 1))
        security_base = base[(page_num - 1) * bg_hs:page_num * bg_hs]
        values = {'security_base': security_base, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (base),'ip':ip_address}
    else:
        page_num = int (request.GET.get ('page', 0))
        if page_num == 0:
            values = {}
        else:
            security_base = base[(page_num - 1) * bg_hs:page_num * bg_hs]
            values = {'security_base': security_base, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (base),'ip':ip_address}
    return values