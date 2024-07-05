#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-7-29 9:54
# Author    :"wangjunlin"

from app import models
from utils import call
from django.db import connection
from django.db.models import Q

def user_page(request,value,search):
    u_number = 0
    # 角色ID：value 查询内容：search
    page_num = int (request.GET.get ('page', 1))
    bg_hs = int (request.GET.get ('limit', 10))
    if search !=None and search != '':
        sear = []
        user_all = models.SysUser.objects.filter ((Q(account=search) | Q(name = search)) & ~Q(account = 'admin')).order_by ('id')
        sear_base = user_all[(page_num - 1) * bg_hs:page_num * bg_hs]
        for se in sear_base.values ('account', 'name', 'gender', 'tell', 'email', 'address', 'id', 'level','sfcj'):
            u_number += 1
            se['order'] = u_number + (page_num - 1) * bg_hs
            sear.append(se)
        return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (user_all), 'data': sear}
    else:
        li = []
        all = models.SysUser.objects.filter(~Q(account = 'admin')).order_by ('id')
        aggregate = all[(page_num - 1) * bg_hs:page_num * bg_hs]
        for n in aggregate.values ('account', 'name', 'gender', 'tell', 'email', 'address', 'id','level','sfcj'):
            if value != None:
                ex_obj = models.SysUserRole.objects.filter (rle_id=value,user_id = str(n['id']))
                if len(ex_obj.values()):
                    n["LAY_CHECKED"] = True
            u_number += 1
            n['order'] = u_number + (page_num - 1) * bg_hs
            li.append (n)
        return {"code": 0,'page_num': page_num, 'bg_hs': bg_hs, 'count': len (all),'data':li}

def role_user(request):
    cur = connection.cursor()
    role_base = request.POST.get ('key', None)
    user_base = request.POST.get ('user_base', None)
    ro_base = eval (role_base)
    exist = []
    # 查询当前角色已有的所有用户ID
    cur.execute ("select distinct(user_id),rle_name from sys_user_role where rle_id=%s", [ro_base[0]])
    user_id = cur.fetchall ()
    for u in user_id:
        exist.append (u[0])
    print('user_base',user_base)
    for user in eval (user_base):
        if user['id'] in exist:
            exist.remove (user['id'])
        else:
            # 如果当前角色下没有该用户ID,就给当前用户ID添加权限
            cur.execute ("INSERT INTO sys_user_role(id,rle_id,rle_name,user_id,user_name) VALUES (%s,%s,%s,%s,%s)",
                         [call.uid(),ro_base[0], ro_base[1], user['id'], user['name']])
    # exist是这次没传过来，但是之前有的用户ID，执行删除操作
    for eu in exist:
        cur.execute ("delete from sys_user_role where rle_id=%s and user_id = %s", [ro_base[0], eu])
    cur.execute("select caption from sys_role where id = %s",[ro_base[0]])
    role_name = cur.fetchall()
    call.create_log (request, 'update', '更新角色用户', role_name[0][0])
    cur.close()
    return True

def role_data(request):
    r_number= 0
    page_num = int (request.GET.get ('page', 1))
    bg_hs = int (request.GET.get ('limit', 10))
    search = request.GET.get ('role_key', None)
    if search != '' and search != None:
        sear_list = []
        Role_all = models.SysRole.objects.filter (caption=search).order_by ('id')
        role_obj =Role_all[(page_num - 1) * bg_hs:page_num * bg_hs]
        for ro in role_obj.values ('id', 'caption', 'abbreviation', 'remark'):
            r_number += 1
            ro['orderid'] = r_number + (page_num - 1) * bg_hs
            sear_list.append (ro)
        return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (Role_all), 'data': sear_list}
    else:
        ro_list = []
        all = models.SysRole.objects.all ().order_by('id')
        ro_obj = all[(page_num - 1) * bg_hs:page_num * bg_hs]
        for r in ro_obj.values ('id', 'caption', 'abbreviation', 'remark'):
            r_number += 1
            r['orderid'] = r_number + (page_num - 1) * bg_hs
            ro_list.append (r)
        return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (all), 'data': ro_list}

def menu(request):
    menu_id = request.GET.get ('menu_id', None)
    m_base = models.SysMenu.objects.filter (id=menu_id)
    base = m_base.values ()
    menu_dic = {}
    if base[0]['pid'] != 0:
        p_sql = models.SysMenu.objects.filter (id=base[0]['pid'])
        p_base = p_sql.values ()
        menu_dic[p_base[0]['id']] = p_base[0]['caption']
        menu_obj = models.SysMenu.objects.filter (pid=0)
        for m in menu_obj.values ('id', 'caption'):
            menu_dic[m['id']] = m['caption']
        menu_dic[0] = 'ROOT'
    else:
        ch_base = models.SysMenu.objects.filter (pid=menu_id)
        menu_dic[0] = 'ROOT'
        if len (ch_base.values ()) == 0:
            p_base1 = models.SysMenu.objects.filter (pid=base[0]['pid'])
            for p_id in p_base1.values ('id', 'caption'):
                if p_id['caption'] != base[0]['caption']:
                    menu_dic[p_id['id']] = p_id['caption']
    return {'menu':menu_dic,'data':base[0]}

def log_page(request):
    page_num = int (request.GET.get ('page', 1))
    bg_hs = int (request.GET.get ('limit', 10))
    log_type = request.GET.get ('log_key', None)
    if log_type != None and log_type != '':
        log_list = []
        all = models.SysLog.objects.filter (type=log_type).order_by ('-time')
        ro_obj = all[(page_num - 1) * bg_hs:page_num * bg_hs]
        number = len (all.values ()) - (page_num - 1) * bg_hs
        for r in ro_obj.values ('accout', 'name', 'type','time','content'):
            r['order'] = number
            number -= 1
            log_list.append (r)
        return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (all), 'data': log_list}
    else:
        ro_list = []
        all = models.SysLog.objects.all ().order_by ('-time')
        ro_obj = all[(page_num - 1) * bg_hs:page_num * bg_hs]
        num = len (all.values ()) - (page_num - 1) * bg_hs
        for r in ro_obj.values ( 'accout', 'name', 'type','time','content'):
            r['order'] = num
            num -= 1
            ro_list.append (r)
        return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (all), 'data': ro_list}

def org_data(request):
    num = 0
    page_num = int (request.GET.get ('page', 1))
    bg_hs = int (request.GET.get ('limit', 10))
    org_id = request.GET.get ('org_id', None)
    search = request.GET.get ('serch_key', None)
    if org_id != None and search != None and search != '':
        org_list = []
        u_id = models.SysUserOrg.objects.filter (org_id=org_id)
        for u in u_id.values ():
            user_data = models.SysUser.objects.filter ((Q(id=u['user_id']), Q(name = search)) & ~Q(account = 'admin'))
            for ud in user_data.values ('account', 'name', 'gender', 'tell', 'email', 'address', 'id', 'level'):
                num += 1
                ud['order'] = num +(page_num - 1) * bg_hs
                org_list.append (ud)
        return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (org_list), 'data': org_list}
    else:
        if org_id != None:
            org_list1 = []
            u_id = models.SysUserOrg.objects.filter (org_id=org_id)
            for u1 in u_id.values ():
                user_data = models.SysUser.objects.filter(id=u1['user_id'])
                for ud1 in user_data.values ('account', 'name', 'gender', 'tell', 'email', 'address', 'id', 'level'):
                    num += 1
                    ud1['order'] = num +(page_num - 1) * bg_hs
                    org_list1.append (ud1)
            u_base1 = org_list1[(page_num - 1) * bg_hs:page_num * bg_hs]
            return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (org_list1), 'data': u_base1}
        elif search != None and search != '':
            sear = []
            user_all = models.SysUser.objects.filter ((Q (account=search) | Q (name=search)) & ~Q(account = 'admin')).order_by ('id')
            sear_base = user_all[(page_num - 1) * bg_hs:page_num * bg_hs]
            for se in sear_base.values ('account', 'name', 'gender', 'tell', 'email', 'address', 'id', 'level'):
                num += 1
                se['order'] = num +(page_num - 1) * bg_hs
                sear.append (se)
            return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (user_all), 'data': sear}
        else:
            li = []
            value = request.GET.get ('0', None)
            all = models.SysUser.objects.filter(~Q(account = 'admin')).order_by ('id')
            aggregate = all[(page_num - 1) * bg_hs:page_num * bg_hs]
            for n in aggregate.values ('account', 'name', 'gender', 'tell', 'email', 'address', 'id', 'level'):
                num += 1
                n['order'] = num +(page_num - 1) * bg_hs
                if value != None:
                    ex_obj = models.SysUserRole.objects.filter (rle_id=value, user_id=str (n['id']))
                    if len (ex_obj.values ()):
                        n["LAY_CHECKED"] = True
                li.append (n)
            return {"code": 0, 'page_num': page_num, 'bg_hs': bg_hs, 'count': len (all), 'data': li}