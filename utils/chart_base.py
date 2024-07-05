#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-5-20 10:55
# Author    :"wangjunlin"
from app import models
import psutil,datetime,time
import os

def creat_path():
    dqlj = os.path.abspath('Monitor')
    models.SysImageSetting.objects.filter(edition=1).update(path=dqlj[:-7]+"face\\",temp_path=dqlj[:-7]+"temp\\")

def delete():
    print('执行历史数据删除操作。')
    time1 = (datetime.datetime.now () + datetime.timedelta (-7)).strftime ("%Y-%m-%d") + " 23:59:59"
    time2 = datetime.datetime.strptime (time1, "%Y-%m-%d %H:%M:%S")
    time3 = int (time.mktime (time2.timetuple ())) * 1000
    del_obj = models.SysHistory.objects.filter (datetime__lt=time3)
    print ("共删除 %s 条数据！" % len (del_obj))
    del_obj.delete()

def timeStamp_two():
    data = []
    for i in range(-20,0):
        disk_dic = {}
        timeStamp =int (time.mktime (time.localtime ()) * 1000) + i *5000
        disk_dic['x'] = timeStamp
        disk_dic['y'] = 0
        data.append(disk_dic)
    return data

LJ_cpu_count = psutil.cpu_count ()

def history_chart():
    da = []
    nw_list = []
    disk_deta_list = []
    everyCPU_lv = psutil.cpu_percent (percpu=True)
    cpu_lv = psutil.cpu_percent ()
    start_time = str(int(time.time ())*1000)
    da.append (str(cpu_lv))
    for m in range (LJ_cpu_count):
        da.append (str(everyCPU_lv[m]))
    # 内存
    me = psutil.virtual_memory ()
    sw = psutil.swap_memory ()
    memory_list = [str(me[0]), str(me[3]), str(me[4]),str(sw[0]),str(sw[1])]
    # 网络
    network = psutil.net_io_counters (pernic=False, nowrap=True)
    for li in list (network[0:6]):
        nw_list.append(str(li))
        # 磁盘明细
    detail_base = psutil.disk_io_counters ()
    num = len (detail_base)
    if num > 6:
       deta_list = detail_base[:6] + detail_base[num - 1:num]
    else:
        deta_list = detail_base[:6]
    for de in  deta_list:
        disk_deta_list.append(str(de))
    dic = {}
    dic['time'] = start_time
    dic['ev'] = ",".join(da)
    dic['memory'] = ",".join(memory_list)
    dic['network'] = ",".join(nw_list)
    dic['disk_detail'] = ",".join(disk_deta_list)
    models.SysHistory.objects.create (datetime=dic['time'], cpu=str (dic['ev']), memory=str (dic['memory']),
                                      network=str (dic['network']), disk_detail=str (dic['disk_detail']))

def chart():
    da = []
    network_byte = []
    network_num = []
    history_chart ()
    everyCPU_lv = psutil.cpu_percent (percpu=True)
    cpu_lv = psutil.cpu_percent ()
    start_time = datetime.datetime.now ().strftime ("%Y-%m-%d %H:%M:%S")
    da.append (cpu_lv)
    # 内存
    me = psutil.virtual_memory ()
    sw = psutil.swap_memory ()
    memory_list = [me[0], me[3], me[4], sw[0], sw[1]]
    # 网络
    network = psutil.net_io_counters (pernic=False, nowrap=True)
    nw_list = list (network[0:6])
    network_byte = list (network[0:2])
    network_num = list (network[2:6])
    for m in range (LJ_cpu_count):
        da.append (everyCPU_lv[m])
    # 磁盘明细
    detail_base = psutil.disk_io_counters ()
    num = len(detail_base)
    if num > 6:
        disk_time = detail_base[4:6] + detail_base[num-1:num]
    else:
        disk_time = detail_base[4:6]
    disk_count = detail_base[:2]
    disk_byte = detail_base[2:4]
    dic = {}
    dic['time'] = start_time
    dic['ev'] = da
    dic['memory'] = memory_list
    dic['network'] = nw_list
    dic['byte'] = network_byte
    dic['other'] = network_num
    dic['disk_count'] = disk_count
    dic['disk_byte'] = disk_byte
    dic['disk_time'] = disk_time
    return dic

def cpu():
    # cpu
    cpu_list = []
    cpu_num = []
    cpu_num.append ('CPU平均使用率')
    for n in range (LJ_cpu_count):
        cpu_num.append (('CPU' + str (n + 1)))
    for n in cpu_num:
        dat = {}
        dat['name'] = n
        dat['data'] = timeStamp_two ()
        cpu_list.append (dat)
    return cpu_list

def memory():
    # 内存
    mem_list = []
    for n1 in ('总内存', '已用内存', '空闲内存', '总交换内存', '已用交换内存'):
        mem = {}
        mem['name'] = n1
        mem['data'] = timeStamp_two ()
        mem['marker'] = {'enabled': False}
        mem_list.append (mem)
    return mem_list

def disk():
    # 磁盘
    d_list = {}
    disk = psutil.disk_partitions (all=True)
    for dis in disk:
        try:
            if psutil.disk_usage (dis[1])[0] != 0:
                list_disk = list(psutil.disk_usage (dis[1])[1:3])
                list_disk.reverse()
                tup_disk = tuple(list_disk)
                d_list[dis[1][0:2]] = tup_disk
        except PermissionError:
            pass
    return  d_list

def byte_work():
    # 网络字节
    byte_list = []
    for nw in ['发送:MB', '接收:MB']:
        net = {}
        net['name'] = nw
        net['data'] = timeStamp_two ()
        net['marker'] = {'enabled': False}
        byte_list.append (net)
    return byte_list

def num_work():
    # 网络次数
    num_list = []
    for nw in ['发送包:万', '接收包:万', '接收错误:个', '发送错误:个']:
        net = {}
        net['name'] = nw
        net['data'] = timeStamp_two ()
        net['marker'] = {'enabled': False}
        num_list.append (net)
    return num_list

def disk_detail():
    # 磁盘明细
    disk_bse = []
    detail_base = psutil.disk_io_counters ()
    name_list = ['读取次数：万次', '写入次数：万次','读取字节：GB', '写入字节:GB','磁盘读取时间：S', '磁盘写入时间：S', 'I/O耗时：S']
    if len(detail_base)>6:
        num = len(detail_base)-2
    else:
        num = len(detail_base)
    for length in range (num):
        d_disk = {}
        d_disk['name'] = name_list[length]
        d_disk['data'] = timeStamp_two ()
        # d_disk['marker'] = {'enabled': False}
        disk_bse.append (d_disk)
    return disk_bse