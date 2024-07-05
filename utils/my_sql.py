#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-8-30 11:30
# Author    :"wangjunlin"
from django.db import connection
import time,datetime

def ex_sql():
    cur = connection.cursor()
    list_tal = []
    cur.execute ("show global status like 'Com_select'")
    select = cur.fetchall ()
    if int (select[0][1]) > 0:
        Com_select = {'name': 'select', 'y': int (select[0][1]),'color':"#e4d354"}
        list_tal.append (Com_select)
    cur.execute ("show global status like 'Com_insert'")
    insert = cur.fetchall ()
    if int (insert[0][1]) > 0:
        Com_insert = {'name': 'insert', 'y': int (insert[0][1]),'color':"#8085e8"}
        list_tal.append (Com_insert)
    cur.execute ("show global status like 'Com_update'")
    update = cur.fetchall ()
    if int (update[0][1]) > 0:
        Com_update = {'name': 'update', 'y': int (update[0][1]),'color':"#8d4653"}
        list_tal.append (Com_update)
    cur.execute ("show global status like 'Com_delete'")
    delete = cur.fetchall ()
    if int (delete[0][1]) > 0:
        Com_delete = {'name': 'delete', 'y': int (delete[0][1]),'color':"#91e8e1"}
        list_tal.append (Com_delete)
    cur.execute ("show global status like 'Com_commit'")
    commit = cur.fetchall ()
    if int (commit[0][1]) > 0:
        Com_commit = {'name': 'commit', 'y': int (commit[0][1]),'color':"#f7a35c"}
        list_tal.append (Com_commit)
    cur.execute ("show global status like 'Com_rollback'")
    rollback = cur.fetchall ()
    if int (rollback[0][1]) > 0:
        Com_rollback = {'name': 'rollback', 'y': int (rollback[0][1]),'color':"#90ed7d"}
        list_tal.append (Com_rollback)
    cur.close()
    return list_tal

def ex_sql_num():
    cur = connection.cursor()
    sql_num = []
    cur.execute ("show global status like 'Com_select'")
    select = cur.fetchall ()
    if int (select[0][1]) > 0:
        Com_select = {'showInLegend': "false",'name': 'select', 'data': [int (select[0][1])],'color':"#90ed7d"}
        sql_num.append (Com_select)
    cur.execute ("show global status like 'Com_insert'")
    insert = cur.fetchall ()
    if int (insert[0][1]) > 0:
        Com_insert = {'name': 'insert', 'data': [int (insert[0][1])],'color':'#f7a35c'}
        sql_num.append (Com_insert)
    cur.execute ("show global status like 'Com_update'")
    update = cur.fetchall ()
    if int (update[0][1]) > 0:
        Com_update = {'name': 'update', 'data': [int (update[0][1])],'color':"#8085e9"}
        sql_num.append (Com_update)
    cur.execute ("show global status like 'Com_delete'")
    delete = cur.fetchall ()
    if int (delete[0][1]) > 0:
        Com_delete = {'name': 'delete', 'data': [int (delete[0][1])],'color':"#f15c80"}
        sql_num.append (Com_delete)
    cur.execute ("show global status like 'Com_commit'")
    commit = cur.fetchall ()
    if int (commit[0][1]) > 0:
        Com_commit = {'name': 'commit', 'data': [int (commit[0][1])], 'color': "#8085e9"}
        sql_num.append (Com_commit)
    cur.execute ("show global status like 'Com_rollback'")
    rollback = cur.fetchall ()
    if int (rollback[0][1]) > 0:
        Com_rollback = {'name': 'rollback', 'data': [int (rollback[0][1])], 'color': "#f15c80"}
        sql_num.append (Com_rollback)
    cur.close()
    return sql_num

def timeStamp():
    data = []
    for i in range(-5,0):
        dic = {}
        timeStamp =int (time.mktime (time.localtime ()) * 1000) + i *5000
        dic['x'] = timeStamp
        dic['y'] = 0
        data.append(dic)
    return data

def connect_one():
    linst_con = []
    date ={}
    date['name'] = '并发用户数'
    date['data'] = timeStamp ()
    linst_con.append(date)
    return linst_con

def connect():
    cur = connection.cursor()
    dic = {}
    start_time = datetime.datetime.now ().strftime ("%Y-%m-%d %H:%M:%S")
    dic['time'] = start_time
    cur.execute("show status like 'Threads_running%'")
    count = cur.fetchall()
    dic['count'] = int(count[0][1])
    cur.close()
    return dic

def table():
    toal_li = []
    cur = connection.cursor()
    cur.execute("show variables like '%wait_timeout%'")
    timeout = cur.fetchall()
    for t in timeout:
        t1 = list(t)
        t1[1] = t1[1] +  ' /S'
        toal_li.append(t1)
    cur.execute("show global status like 'Uptime'")
    Uptime = cur.fetchall()
    for u in Uptime:
        u1 = list(u)
        u1[1] = u1[1] + ' /S'
        toal_li.append(u1)
    cur.execute("show global status like 'Questions'")
    Questions = cur.fetchall()
    for q in Questions:
        Company = list(q)
        Company[1] = str(Company[1]) + ' 个'
        toal_li.append(Company)
    cur.execute("show status like 'Threads_running%'")
    user = cur.fetchall()
    for us in user:
        us_num = list(us)
        us_num[1] = us_num[1] + ' 个'
        toal_li.append (us_num)
    cur.execute("show global status like 'Max_used_connections'")
    connect = cur.fetchall()
    for con in connect:
        con1 = list(con)
        con1[1] = str(con1[1]) + ' 个'
        toal_li.append(con1)
    cur.close()
    return toal_li

def num():
    toal_num =[]
    cur = connection.cursor()
    cur.execute("show global status like 'Key_read_requests'")
    Key_read = cur.fetchall()
    for k in Key_read:
        toal_num.append(list(k))
    cur.execute("show global status like 'Key_writes'")
    Key_writes = cur.fetchall()
    for w in Key_writes:
        toal_num.append(list(w))
    cur.execute("show global status like 'Innodb_buffer_pool_reads'")
    pool_reads = cur.fetchall()
    for p in pool_reads:
        toal_num.append(list(p))
    cur.execute("show global status like 'Innodb_buffer_pool_read_requests'")
    read_requests = cur.fetchall()
    for r in read_requests:
        toal_num.append(list(r))
    cur.execute("show global status like 'Qcache_hits'")
    Qcache = cur.fetchall()
    for q in Qcache:
        toal_num.append(list(q))
    cur.execute("show global status like 'Open_tables'")
    Open = cur.fetchall()
    for o in Open:
        toal_num.append(list(o))
    cur.execute("show global status like 'Opened_tables'")
    Opened = cur.fetchall()
    for od in Opened:
        toal_num.append(list(od))
    cur.close()
    return toal_num

def surface():
    toal_sur = []
    cur = connection.cursor()
    cur.execute("show global status like 'Table_locks_waited'")
    locks_waited = cur.fetchall()
    for l in locks_waited:
        toal_sur.append(list(l))
    cur.execute("show global status like 'Table_locks_immediate'")
    locks_immediate = cur.fetchall()
    for li in locks_immediate:
        toal_sur.append(list(li))
    cur.execute("show global status like 'Created_tmp_tables'")
    tmp_tables = cur.fetchall()
    for t in tmp_tables:
        toal_sur.append(list(t))
    cur.execute("show global status like 'Created_tmp_disk_tables'")
    tmp_disk_tables = cur.fetchall()
    for tdt in tmp_disk_tables:
        toal_sur.append(list(tdt))
    cur.execute("show global status like 'Slow_queries'")
    Slow_queries = cur.fetchall()
    for s in Slow_queries:
        toal_sur.append(list(s))
    cur.execute("show global status like 'Select_full_join'")
    full_join = cur.fetchall()
    for f in full_join:
        toal_sur.append(list(f))
    cur.execute("show global status like 'Threads_connected'")
    connected = cur.fetchall()
    for cn in connected:
        toal_sur.append(list(cn))
    cur.close
    return toal_sur

def scan():
    scan_list = []
    cur = connection.cursor()
    cur.execute("show global status like 'handler_read%'")
    handler_read = cur.fetchall()
    for h in handler_read:
        scan_list.append(list(h))
    cur.close
    return scan_list

def Percentage():
    Per_li = []
    Per_dic = {}
    cur = connection.cursor()
    cur.execute("show status like 'innodb_buffer_pool_reads%'")
    reads = cur.fetchall ()
    cur.execute ("show status like 'innodb_buffer_pool_read_requests%'")
    requests = cur.fetchall ()
    innodb_buffer_read_hit_ratio = (1 - int( reads[0][1])/int(requests[0][1])) * 100
    Per_dic['name'] = 'innodb_buffer_read_hit_ratio'
    Per_dic['y'] = innodb_buffer_read_hit_ratio
    Per_li.append(Per_dic)
    Per_dic = {}
    cur.execute("show status like 'innodb_buffer_pool_pages_free%'")
    free = cur.fetchall ()
    cur.execute ("show status like 'innodb_buffer_pool_pages_total%'")
    pages_total = cur.fetchall ()
    innodb_buffer_usage = (1 - int (free[0][1]) / int (pages_total[0][1])) * 100
    Per_dic['name'] = 'innodb_buffer_usage'
    Per_dic['y'] = innodb_buffer_usage
    Per_li.append(Per_dic)
    Per_dic = {}
    cur.execute("show status like 'innodb_buffer_pool_pages_dirty%'")
    dirty = cur.fetchall ()
    cur.execute ("show status like 'innodb_buffer_pool_pages_total%'")
    dirty_total = cur.fetchall ()
    innodb_buffer_pool_pages_dirty = int (dirty[0][1]) / int (dirty_total[0][1])
    Per_dic['name'] = 'innodb_buffer_pool_pages_dirty'
    Per_dic['y'] = innodb_buffer_pool_pages_dirty
    Per_li.append(Per_dic)
    Per_dic = {}
    cur.execute("show global status like 'Table_locks_waited'")
    locks_waited = cur.fetchall()
    cur.execute("show global status like 'Table_locks_immediate'")
    locks_immediate = cur.fetchall()
    lock_blockage = int(locks_waited[0][1]) / int(locks_immediate[0][1])
    Per_dic['name'] = 'Watch_lock_blockage'
    Per_dic['y'] = lock_blockage
    Per_li.append(Per_dic)
    Per_dic = {}
    cur.execute("show global status like 'Created_tmp_disk_tables'")
    disk_tables = cur.fetchall()
    cur.execute("show global status like 'Created_tmp_tables'")
    tmp_tables = cur.fetchall()
    Delay_Time = int(disk_tables[0][1]) / int(tmp_tables[0][1])
    Per_dic['name'] = 'Delay_Time'
    Per_dic['y'] = Delay_Time
    Per_li.append(Per_dic)
    cur.close()
    return  Per_li

def QT():
    qt_li = []
    qt_dic = {}
    cur = connection.cursor()
    cur.execute("show global status like 'Com_commit'")
    commit = cur.fetchall ()
    Com_commit = commit[0][1]
    cur.execute ("show global status like 'Com_rollback'")
    rollback = cur.fetchall ()
    Com_rollback = rollback[0][1]
    cur.execute("show global status like 'Questions'")
    Questions = cur.fetchall()
    cur.execute("show global status like 'Uptime'")
    Uptime = cur.fetchall()
    QPS = int(Questions[0][1]) / int(Uptime[0][1])
    qt_dic['name'] = 'QPS'
    qt_dic['y'] = QPS
    qt_li.append(qt_dic)
    qt_dic = {}
    TPS = (int(Com_commit) + int(Com_rollback)) / int(Uptime[0][1])
    qt_dic['name'] = 'TPS'
    qt_dic['y'] = TPS
    qt_li.append(qt_dic)
    cur.close()
    return  qt_li

def constitute():
    cons_list = []
    cons_list.append([connect ()])
    cons_list.append(QT())
    cons_list.append(Percentage ())
    cons_list.append(ex_sql())
    cons_list.append(ex_sql_num())
    return cons_list