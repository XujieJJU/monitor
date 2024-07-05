#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-7-29 10:20
# Author    :"wangjunlin"

import time,json
from app import models

def history_page(request):
    if request.method == 'POST':
        search_base1 = request.POST.get ('search', None)
        # 计算查询时间前5分钟的数据
        if search_base1 != '':
            endtime = int (time.mktime (time.strptime (search_base1, "%Y-%m-%d %H:%M:%S"))) * 1000
            starttime = endtime - 300 * 1000
        else:
            starttime = str ((int (time.time ()) - 300) * 1000)
            endtime = str (int (time.time ()) * 1000)
        p_time = time.strftime ("%Y-%m-%d %H:%M:%S", time.localtime ((int (endtime)) / 1000))
    else:
        starttime = str ((int (time.time ()) - 300) * 1000)
        endtime = str (int (time.time ()) * 1000)
        p_time = ''
    his_base = []
    obj = models.SysHistory.objects.filter (datetime__gte=starttime, datetime__lte=endtime).order_by ('datetime')
    if len (obj) > 0:
        for i in obj.values ('datetime', 'cpu', 'memory', 'network', 'disk_detail'):
            his_base.append (tuple (i.values ()))
    if len (his_base) > 0:
        # CPU
        for i in range (len (his_base)):
            li_cpu = his_base[i][1].split (",")
        cpu_num = []
        cpu_list = []
        for n in range (len (li_cpu)):
            if n == 0:
                cpu_num.append (('CPU' + '平均使用率'))
            cpu_num.append (('CPU' + str (n + 1)))
        for p in range (len (his_base)):
            if p == 0:
                for m in range (len (li_cpu)):
                    dat = {}
                    dat['name'] = cpu_num[m]
                    dat['data'] = [[float (his_base[p][0]), float (his_base[p][1].split (",")[m])]]
                    cpu_list.append (dat)
            else:
                for m in range (len (li_cpu)):
                    cpu_list[m]['data'].append ([float (his_base[p][0]), float (his_base[p][1].split (",")[m])])
        # 内存
        mem_total = []
        mem_use = []
        mem_free = []
        mem_tsw = []
        mem_usw = []
        for m1 in range (len (his_base)):
            mem_total.append ([float (his_base[m1][0]), int (his_base[m1][2].split (",")[0]) / 1024 / 1024 / 1024])
            mem_use.append ([float (his_base[m1][0]), int (his_base[m1][2].split (",")[1]) / 1024 / 1024 / 1024])
            mem_free.append ([float (his_base[m1][0]), int (his_base[m1][2].split (",")[2]) / 1024 / 1024 / 1024])
            mem_tsw.append ([float (his_base[m1][0]), int (his_base[m1][2].split (",")[3]) / 1024 / 1024 / 1024])
            mem_usw.append ([float (his_base[m1][0]), int (his_base[m1][2].split (",")[4]) / 1024 / 1024 / 1024])
        memory = [{'name': '总内存', 'data': mem_total}, {'name': '已用内存', 'data': mem_use},
                  {'name': '空闲内存', 'data': mem_free}, {'name': '总交换内存', 'data': mem_tsw},
                  {'name': '已用交换内存', 'data': mem_usw}]
        # 网络
        send = []
        receive = []
        for n1 in range (len (his_base)):
            send.append ([float (his_base[n1][0]), int (his_base[n1][3].split (",")[0]) / 1024 / 1024])
            receive.append ([float (his_base[n1][0]), int (his_base[n1][3].split (",")[1]) / 1024 / 1024])
        network = [{'name': '发送字节', 'data': send}, {'name': '接收字节', 'data': receive}]
        # 磁盘
        disk_list = []
        disk_list1 = []
        disk_list2 = []
        disk_list3 = []
        nw_name = ['读取次数', '写入次数', '读取字节', '写入字节', '磁盘读取时间', '磁盘写入时间', 'I/O耗时']
        for p1 in range (len (his_base)):
            if len (his_base[p1][4].split (",")) < 7:
                length = len (his_base[p1][4].split (","))
            else:
                length = 7
            if p1 == 0:
                for m2 in range (length):
                    dat = {}
                    dat['name'] = nw_name[m2]
                    if m2 < 2:
                        dat['data'] = [[float (his_base[p1][0]), float (his_base[p1][4].split (",")[m2]) / 10000]]
                    elif 1 < m2 < 4:
                        dat['data'] = [
                            [float (his_base[p1][0]), float (his_base[p1][4].split (",")[m2]) / 1024 / 1024 / 1024]]
                    else:
                        dat['data'] = [[float (his_base[p1][0]), float (his_base[p1][4].split (",")[m2]) / 1000]]
                    disk_list.append (dat)
            else:
                for m3 in range (length):
                    if len (disk_list[m3]['data']) > 99:
                        del disk_list[m3]['data'][0]
                    if m3 < 2:
                        disk_list[m3]['data'].append (
                            [float (his_base[p1][0]), float (his_base[p1][4].split (",")[m3]) / 10000])
                    elif 1 < m3 < 4:
                        disk_list[m3]['data'].append (
                            [float (his_base[p1][0]), float (his_base[p1][4].split (",")[m3]) / 1024 / 1024 / 1024])
                    else:
                        disk_list[m3]['data'].append (
                            [float (his_base[p1][0]), float (his_base[p1][4].split (",")[m3]) / 1000])
        for n in range (length):
            if n < 2:
                disk_list1.append (disk_list[n])
            elif 1 < n < 4:
                disk_list2.append (disk_list[n])
            else:
                disk_list3.append (disk_list[n])
        return {'date': json.dumps (cpu_list), 'memory': json.dumps (memory), 'network': json.dumps (network),'disk1': json.dumps (disk_list1), 'disk2': json.dumps (disk_list2),'disk3': json.dumps (disk_list3),'time':p_time}
    else:
        return {'date': json.dumps ([]), 'memory': json.dumps ([]), 'network': json.dumps ([]),'disk1': json.dumps ([]), 'disk2': json.dumps ([]), 'disk3': json.dumps ([]),'time':p_time}