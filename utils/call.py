#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-11-18 9:26
# Author    :"wangjunlin"
from app import models
import datetime,uuid
import hashlib
from utils import call
from django.db import connection
import cv2,os,time

def now_time():
    n_time = datetime.datetime.now ().strftime ("%Y-%m-%d %H:%M:%S")
    return n_time

def is_login(request):
    try:
        request.session['is_login']
    except KeyError:
        return False
    else:
        return True

def uid():
    uid = str (uuid.uuid1())
    suid = ''.join (uid.split ('-'))
    return suid

def create_menu(id):
    Parent = []
    Node = {}
    menu1 = ''
    menu2 = ''
    # 查询所有的PID
    for i in id:
        q_obj = models.SysMenu.objects.filter (id=i)
        for q in q_obj.values ('id', 'caption', 'lcon', 'url', 'pid'):
            if q['pid'] not in Parent:
                if q['pid'] != 0:
                    Parent.append (q['pid'])
                    if int(q['pid']) in id:
                        id.remove(int(q['pid']))
                else:
                    if q['pid'] not in Parent:
                        Parent.append (q['id'])
    #对一级节点进行排序
    ord_obj = models.SysMenu.objects.filter (pid=0).order_by('order')
    temp = [0]
    for no in ord_obj.values('id'):
        temp.append (no['id'])
    data = sorted(Parent, key=temp.index)#让一级节点Parent列表按照temp进行排序
    # 查询每个根节点下的所有子节点
    for p in data:
        Child = []
        p_obj = models.SysMenu.objects.filter (pid=p).order_by('order')
        for n in p_obj.values ('id'):
            Child.append (n['id'])
        # 求二级节点交集并按照Child列表进行排序
        Node[p] = sorted(list(set(id)&set(Child)),key=Child.index)
    menu = ''
    for k,v in Node.items():
        if v != []:
            # 如果父节点不是根节点，则查询节点下的所有子节点
            m_obj = models.SysMenu.objects.filter (id=k)
            for m in m_obj.values ('id', 'caption', 'lcon', 'url'):
                menu2 = "<li class='layui-nav-item'><a href='javascript:;'><i class='"  + 'fa '+ str (m['lcon']) + ' pad' + "'></i>" + str (
                    m['caption']) + "</a><dl class='layui-nav-child'>"
            for v1 in v:
                v_obj = models.SysMenu.objects.filter (id=v1)
                for v2 in v_obj.values('id', 'caption', 'lcon', 'url'):
                    menu3 = "<dd><a href='javascript:;' data-url='" + str (v2['url']) + "' data-id='" + str (
                        v2['id']) + "' data-text=" + str (v2['caption']) + "><span class='" + 'Submenu ' +'fa ' + str (
                        v2['lcon']) + ' pad' + "'></span>" + str (v2['caption']) + "</a></dd>"
                    menu2 += menu3
            menu2 += "</dl></li>"
            menu += menu2
        else:
            # 如果父节点是根节点，则直接生成菜单
            ml_obj = models.SysMenu.objects.filter (id=k)
            for i in ml_obj.values ('id', 'caption', 'lcon', 'url'):
                menu1 = "<li class='layui-nav-item'><a href='javascript:;' data-url='" + str (
                    i['url']) + "' data-id='" + str (
                    i['id']) + "' data-text=" + str (i['caption']) + "><i class='" + 'fa '+ str (i['lcon']) + ' pad' + "'></i>" + str (
                    i['caption']) + "</a></li>"
            menu += menu1
    return menu

'''原始做法 暂时没找到合适的方法，暂时代替'''
def create_tree():
    layer = []
    base = {}
    org_obj = models.SysOrg.objects.filter (pid=0)
    for i in range (0,len(org_obj)):
        base['title'] = org_obj.values()[i]['org_name']
        base['id'] = org_obj.values()[i]['id']
        ch_obj = models.SysOrg.objects.filter(pid = org_obj.values()[i]['id'])
        if len(ch_obj.values()) > 0:
            base['children'] =[]
            for i1 in ch_obj.values():
                base1 = {'title': i1['org_name'], 'id': i1['id'],'children':[]}
                ch_obj1 = models.SysOrg.objects.filter(pid = i1['id'])
                if len(ch_obj1.values()) > 0:
                    for i2 in ch_obj1.values():
                        base2 = {'title': i2['org_name'], 'id': i2['id'], 'children': []}
                        ch_obj2 = models.SysOrg.objects.filter (pid=i2['id'])
                        if len(ch_obj2.values()) > 0:
                            for i3 in ch_obj2.values ():
                                base3= {'title': i3['org_name'], 'id': i3['id'], 'children': []}
                                ch_obj3 = models.SysOrg.objects.filter (pid=i3['id'])
                                if len (ch_obj3.values ()) > 0:
                                    for i4 in ch_obj3.values ():
                                        base4 = {'title': i4['org_name'], 'id': i4['id'], 'children': []}
                                        ch_obj4 = models.SysOrg.objects.filter (pid=i4['id'])
                                        if len(ch_obj4.values()) > 0:
                                            for i5 in ch_obj4.values():
                                                base4['children'].append({'title': i5['org_name'], 'id': i5['id']})
                                            base3['children'].append (base4)
                                        else:
                                            base3['children'].append ({'title': i4['org_name'], 'id': i4['id'], 'children': []})
                                    base2['children'].append (base3)
                                else:
                                    base2['children'].append({'title': i3['org_name'], 'id': i3['id'], 'children': []})
                            base1['children'].append (base2)
                        else:
                            base1['children'] .append({'title': i2['org_name'], 'id': i2['id']})
                    base['children'].append (base1)
                else:
                    base['children'].append ({'title': i1['org_name'], 'id': i1['id']})
    layer.append(base)
    return layer

def inser_user(request):
    data = request.POST
    # 查询账号是否存在
    ex_acc = models.SysUser.objects.filter (account=data['base[account]'])
    if len (ex_acc) == 0:
        # 判断两次密码是否一致
        if data['base[password2]'] == data['base[password3]']:
            dense = hashlib.md5 ()
            dense.update (data['base[password2]'].encode (encoding='utf-8'))
            models.SysUser.objects.create (id=uid(),account=data['base[account]'], name=data['base[name]'], pwd=dense.hexdigest (),
                                        gender=data['base[sex]'], tell=data['base[tell]'], email=data['base[email]'],
                                        address=data['base[address]'],level='普通用户')
            org_id = data['base[select]'].split (",")
            for i in org_id:
                org_obj = models.SysOrg.objects.filter (id=i)
                u_id = models.SysUser.objects.filter (name=data['base[name]'])
                models.SysUserOrg.objects.create (org_id=i, org_name=org_obj.values ()[0]['org_name'],
                                                user_id=u_id.values ()[0]['id'], user_name=data['base[name]'])
            create_log (request, 'create', '新增用户', data['base[name]'])
            return True
        else:
            return 'error_pwd'
    else:
        return 'exis_user'

def edit_user(request):
    temp = request.POST
    if temp['base[password2]'] == temp['base[password3]']:
        edit_dense = hashlib.md5 ()
        edit_dense.update (temp['base[password2]'].encode (encoding='utf-8'))
        models.SysUser.objects.filter (id=temp['base[id]']).update (name=temp['base[name]'], pwd=edit_dense.hexdigest (),
                                                                 gender=temp['base[sex]'], tell=temp['base[tell]'],
                                                                 email=temp['base[email]'],
                                                                 address=temp['base[address]'])
        ex_uorg = models.SysUserOrg.objects.filter (user_id=temp['base[id]'])
        org_list = []
        for ex in ex_uorg.values ():
            org_list.append (ex['id'])
        org_b = temp['base[select]'].split (",")
        if len (org_list) > len (org_b):
            big = len (org_list)
        else:
            big = len (org_b)
        for u in range (0, big):
            if u + 1 <= len (org_b) and u + 1 <= len (org_list):
                org_obj = models.SysOrg.objects.filter (id=org_b[u])
                models.SysUserOrg.objects.filter (id=org_list[u]).update (org_id=org_b[u],
                                                                        org_name=org_obj.values ()[0]['org_name'],
                                                                        user_id=temp['base[id]'],
                                                                        user_name=temp['base[name]'])
            elif u + 1 > len (org_b):
                models.SysUserOrg.objects.filter (id=org_list[u]).delete ()
            elif u + 1 > len (org_list):
                org_obj1 = models.SysOrg.objects.filter (id=org_b[u])
                models.SysUserOrg.objects.create (id=call.uid(),org_id=org_b[u], org_name=org_obj1.values ()[0]['org_name'],
                                                user_id=temp['base[id]'], user_name=temp['base[name]'])
        create_log (request, 'update', '修改用户', temp['base[name]'])
        return True
    else:
        return False

def ex_data(user_id):
    ob_list = []
    ex_obj = models.SysUserOrg.objects.filter(user_id=user_id)
    for ob in ex_obj.values():
        ob_data = {}
        ob_data['title'] = ob['org_name']
        ob_data['id'] = ob['org_id']
        ob_list.append(ob_data)
    return ob_list

def ex_btn(user_id):
    ob_list = []
    ex_obj = models.SysUserOrg.objects.filter(user_id=user_id)
    for ob in ex_obj.values():
        ob_list.append(ob['org_name'])
    return ob_list

def create_log(request,values,tex,name):
    u_name = request.session['u']
    account = request.session['acc']
    text = u_name + tex + '：《' + name + "》"
    models.SysLog.objects.create (id=uid(),accout=account, name=u_name, type=values, time=now_time(), content=text)

def face_cj(request):
    re_base = request.POST
    if re_base['key'] == 'update':
        if 'base[close]' in re_base.keys():
            zt = 1
        else:
            zt =0
        try:
            models.SysImageSetting.objects.filter(edition=1).update(path=re_base['base[save_path]'],cjcs=re_base['base[cj_conut]'],jgsj=re_base['base[cj_time]'],temp_path=re_base['base[catalog]'],dqsj=re_base['base[login_time]'],sfqy=zt)
            return True
        except:
            return False
    elif re_base['key'] == '人脸采集':
        mim = models.SysImageSetting.objects.filter(edition=1)
        for m in mim.values('path', 'cjcs', 'jgsj'):
            d_path = list(m.values())[0]
            cjcs = list(m.values())[1]
            jgsj = list(m.values())[2]
        try:
            cap = cv2.VideoCapture(0)
            flag = cap.isOpened()
            dir_path = d_path + re_base['account'] + '/'
            ex_path = os.path.exists(dir_path)
            if ex_path == False:
                os.makedirs(dir_path)
            start_time = datetime.datetime.now()
            cnum = 1
            while (flag):
                ret, frame = cap.read()
                cv2.imshow("Capture_Paizhao", frame)
                end_time = datetime.datetime.now()
                cv2.waitKey(1) & 0xFF
                if (end_time - start_time).seconds >= jgsj * cnum:
                    cv2.imencode('.jpg', frame)[1].tofile(dir_path + re_base['account'] + str(cnum) + '.jpg')
                    time.sleep(1)
                    cnum += 1
                    if cnum > cjcs:
                        break
            cap.release()
            cv2.destroyAllWindows()
            if re_base['zt'] != '1':
                models.SysUser.objects.filter(id=re_base['id']).update(sfcj=1)
            return True
        except:
            cap.release()
            cv2.destroyAllWindows()
            return False