#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-11-5 10:06
# Author    :"wangjunlin"
from bs4 import BeautifulSoup
import sys
import requests
from app import models
import re
import time

# sys.stdout.flush() #刷新缓冲区

def data_cleaning():
    try:
        """从网页上爬去数据"""
        f = open('downloaded_data.xml', 'w', encoding='utf-8')
        url = requests.get("http://hl.anseo.cn/")
        base = str(url.status_code) + str(url.text)
        f.write(base)
        f.flush()
        soup = BeautifulSoup(
            open('downloaded_data.xml', encoding='utf-8'))  # 将本地 downloaded_data.xml 文件打开，用它来创建 soup 对象

        """第一次数据过滤"""
        f2 = open('temp_one', 'w', encoding='utf-8')
        tem = str(soup.find(id="rates"))
        f2.write(tem)

        """第二次数据过滤"""
        soup1 = BeautifulSoup(open('temp_one', encoding='utf-8'))
        f1 = open('temp_two', 'w', encoding='utf-8')
        for string in soup1.div.stripped_strings:
            f1.write(string.strip() + "\n")

        """第三次数据过滤"""
        f = open('temp_two', 'r+', encoding='utf-8')
        list = []
        for i in f:
            list.append(i.strip())
        models.Conversion.objects.all().delete()
        list1 = []
        counted = 0
        number = 0
        for i in list:
            counted += 1
            list1.append(i)
            if counted % 4 == 0:
                number += 1
                replace = (re.findall(r"=(.+?.+)", list1[0]))
                replace1 = (re.findall(r"(.+?.+) =", list1[0]))
                replace1 = (replace1[0]).strip()
                replace = (replace[0]).strip()
                models.Conversion.objects.create(initial=replace1, exchange_rate=replace, target=list1[1],
                                                 abbreviation=list1[2], remarks=list1[3])
                list1 = []
        return True
    except:
        return False


def search_reptile(page_num,bg_hs,search):
    reptile_dic = {}
    reptile_list = []
    start_num = (page_num-1) * bg_hs
    end_num = page_num * bg_hs
    if search != None and search != '':
        search_obj = models.Conversion.objects.filter(target__contains = search)
        if len(search_obj.values()) > 0:
            for s in search_obj.values('initial', 'exchange_rate', 'target', 'abbreviation', 'remarks'):
                reptile_list.append (s)
        reptile_dic['code'] = 0
        reptile_dic['msg'] = ''
        reptile_dic['count'] = len(search_obj.values())
        reptile_dic['data'] = reptile_list[start_num:end_num]
        return reptile_dic
    else:
        obj = models.Conversion.objects.all ()
        if len (obj) > 0:
            for i in obj.values ('initial', 'exchange_rate', 'target', 'abbreviation', 'remarks'):
                reptile_list.append(i)
        reptile_dic['code'] = 0
        reptile_dic['msg'] = ''
        reptile_dic['count'] = len (obj)
        reptile_dic['data'] = reptile_list[start_num:end_num]
        return reptile_dic