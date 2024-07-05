#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-5-23 15:31
# Author    :"wangjunlin"
import psutil,datetime,time
import signal,os
import socket,threading
import operator

def process():
    process_list = []
    count = 0
    for proc in psutil.process_iter ():
        try:
            pinfo = proc.as_dict (attrs=['pid', 'name', 'username'])
        except psutil.NoSuchProcess:
            pass
        else:
            pinfo1 = {}
            count += 1
            pinfo1['order'] = count
            pinfo1['pid'] = pinfo['pid']
            pinfo1['name'] = pinfo['name']
            pinfo1['username'] = pinfo['username']
            process_list.append (pinfo1)
            p = psutil.Process (pid=pinfo['pid'])
            t = datetime.datetime.fromtimestamp (psutil.Process ().create_time ()).strftime ("%Y-%m-%d %H:%M:%S")
            pinfo1['create_time'] = t
            pinfo1['physical_memory'] = str ('%.2f' %(p.memory_info ().rss/1024/1024)) + ' MB'
            pinfo1['virtual_memory'] = str ('%.2f' %(p.memory_info ().vms/1024/1024)) + ' MB'
            pinfo1['status'] = str (p.status())
    return process_list

def process_page(request):
    global process_list
    page_num = int (request.GET.get ('page', 1))
    if page_num == 1:
        process_list = process ()
    bg_hs = int (request.GET.get ('limit', 10))
    search = request.GET.get ('keyword', None)
    process_list1 = process_list[(page_num - 1) * bg_hs:page_num * bg_hs]
    count = len (process ())
    if search != '' and search != None:
        li_search = []
        for i in process_list:
            if search in i['name']:
                li_search.append (i)
        if len (li_search) > 0:
            return {'data': li_search, 'code': 0, 'msg': '','count': len (li_search)}
        else:
            return {'data': process_list1, 'code': 0, 'msg': '','count': len(process_list1)}
    return {'data': process_list1, 'code': 0, 'msg': '','count': count}

def edition():
    if psutil.WINDOWS == True:
        terrace = 'WINDOWS'
    elif psutil.LINUX == True:
        terrace = 'LINUX'
    else:
        terrace = '未知'
    return terrace

def total():
    li_st = []
    terrace = edition()
    total_list = {}
    count = 0
    d = psutil.net_if_addrs ()
    host_name = socket.gethostname ()
    count += 1
    total_list['order'] = count
    total_list['name'] = '服务器名称'
    total_list['host'] = host_name
    li_st.append(total_list)
    for name,values in d.items ():
        for item in values:
            if item[0] == 2 and not item[1] == '127.0.0.1':
                total_list1 = {}
                count += 1
                total_list1['order'] = count
                total_list1['name'] = '网络连接'+'('+ name+')'
                total_list1['host'] = item[1]
                li_st.append (total_list1)
    total_list2 = {}
    count += 1
    total_list2['order'] = count
    total_list2['name'] = '系统版本'
    total_list2['host'] = terrace
    li_st.append (total_list2)
    total_list3 = {}
    count += 1
    total_list3['order'] = count
    boot_time = datetime.datetime.fromtimestamp (psutil.boot_time ()).strftime ("%Y-%m-%d %H:%M:%S")
    total_list3['name'] = '开机时间'
    total_list3['host'] = boot_time
    li_st.append (total_list3)
    total_list4 = {}
    cpu_count = psutil.cpu_count ()
    count += 1
    total_list4['order'] = count
    total_list4['name'] = '逻辑CPU'
    total_list4['host'] = str (cpu_count) + '个'
    li_st.append (total_list4)
    total_list5 = {}
    frequency = psutil.cpu_freq ()
    count += 1
    total_list5['order'] = count
    total_list5['name'] = 'CPU核定功率'
    total_list5['host'] = str('%.2f' %(frequency[0]/1000)) + "Gmz"
    li_st.append (total_list5)
    total_list6 = {}
    count += 1
    total_list6['order'] = count
    total_list6['name'] = 'CPU最大功率'
    total_list6['host'] = str('%.2f' %(frequency[2]/1000)) + "Gmz"
    li_st.append (total_list6)
    total_list7 = {}
    mome = str ('%.1f' % (psutil.virtual_memory ()[0] / 1024 / 1024 / 1024)) + 'GB'
    count += 1
    total_list7['order'] = count
    total_list7['name'] = '内存大小'
    total_list7['host'] = mome
    li_st.append (total_list7)
    if psutil.sensors_battery () == None:
        battery = '无'
    else:
        battery = str(psutil.sensors_battery ()[0]) + '%'
    total_list8 = {}
    count += 1
    total_list8['order'] = count
    total_list8['name'] = '剩余电量'
    total_list8['host'] = str (battery)
    li_st.append (total_list8)
    return li_st

def network():
    network_list = []
    inter = psutil.net_if_addrs ()
    for net_work in inter:
        network_list.append (net_work)
    return network_list

def summary(request):
    total_dic = {}
    dic_list = total ()
    count = len(dic_list)
    network_list = network ()
    page_num = int (request.GET.get ('page', 1))
    bg_hs = int (request.GET.get ('limit', 10))
    for n in range(len(network_list)):
        total_list = {}
        count += 1
        total_list['order'] = count
        total_list['name'] = '网络适配器' + '(' + str(n+1) + ')'
        total_list['host'] = network_list[n]
        dic_list.append(total_list)
    total_dic['code'] = 0
    total_dic['msg'] = ''
    total_dic['count'] = len (dic_list)
    total_dic["data"] = dic_list[(page_num - 1) * bg_hs:page_num * bg_hs]
    return total_dic

def con_user(request):
    total = {}
    con_user_list = []
    con_user_dic = {}
    page_num = int (request.GET.get ('page', 1))
    bg_hs = int (request.GET.get ('limit', 10))
    con_user = psutil.users ()
    total['code'] = 0
    total['msg'] = ''
    total['count'] = len (con_user)
    for one in range (len (con_user)):
        con_user_dic['order'] = one
        for two in range (5):
            con_user_dic['name'] = con_user[one][0]
            con_user_dic['terminal'] = con_user[one][1]
            con_user_dic['host'] = con_user[one][2]
            con_user_dic['pid'] = con_user[one][4]
            if two == 3:
                date = time.localtime (con_user[one][two])
                con_user_dic['started'] = (time.strftime ("%Y:%m:%d %H:%M:%S", date))
        con_user_list.append(con_user_dic)
    process_list = con_user_list[(page_num - 1) * bg_hs:page_num * bg_hs]
    total["data"] = process_list
    return total

def init(pid):
    try:
        int(pid)
        return True
    except:
        return False

def kill_proc_tree(pid, sig=signal.SIGTERM, include_parent=True,timeout=None, on_terminate=None):
    terrace = edition ()
    if terrace =='WINDOWS':
        if init(pid):
           try:
               """Kill a process tree (including grandchildren) with signal
               "sig" and return a (gone, still_alive) tuple.
               "on_terminate", if specified, is a callabck function which is
               called as soon as a child terminates.
               """
               pid = int(pid)
               assert pid != os.getpid (), "won't kill myself"
               parent = psutil.Process (pid)
               children = parent.children (recursive=True)
               if include_parent:
                   children.append (parent)
               for p in children:
                   p.send_signal (sig)
               psutil.wait_procs (children, timeout=timeout,callback=on_terminate)
               return True
           except:
               return False
        else:
            return 'other'
    elif terrace == 'LINUX':
        if init (pid):
            cmd = 'kill -9 ' + str (pid)
            try:
                os.system (cmd)
                return True
            except:
                return False
        else:
            return 'other'

def scan(ip,cmd):
    print('*******************')
    try:
        ex_res = os.popen (cmd).read ()
        re_place1 = ex_res.replace ("\n", "<br>")
        if '时间' in ex_res:
            base = [ip,str (True),re_place1]
            print('base',base)
            re_li.append(base)
    except Exception:
        return '出现系统错误'

re_li = []
def ip_scan(request):
    global re_li
    ip = request.POST.get ('ip', None)
    ip_sp = str(ip).split('.')
    if request.method == 'POST':
        re_li = []
        obj = []
        try:
            lost = int (ip_sp[3])
            for i in range (lost, 256):
                ip_sp[3] = str(i)
                new_ip = '.'.join(ip_sp)
                cmd = 'ping ' + ' -n' + ' 1 ' + str (new_ip)
                t = threading.Thread (target=scan, args=(new_ip, cmd))
                t.start ()
                obj.append (t)
            for i1 in obj:
                i1.join ()
            if ip != '' and ip != None:
                page_num = 1
                bg_hs = 10
                re_li.sort (key=operator.itemgetter (0))
                base = re_li[(page_num - 1) * bg_hs: page_num * bg_hs]
                return {'result':base,'count':len(re_li),'page_num': page_num, 'bg_hs': bg_hs,'search':ip}
        except Exception:
            print('没有输入ip地址')
    else:
        num = request.GET.get ('page', None)
        if num == None:
            page_num = 0
            re_li = []
        else:
            page_num = int (request.GET.get ('page'))
        bg_hs = int (request.GET.get ('limit', 10))
        base = re_li[(page_num - 1) * bg_hs: page_num * bg_hs]
        return {'result': base, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (re_li)}