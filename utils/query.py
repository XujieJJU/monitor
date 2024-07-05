#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Time      :2019-11-18 9:58
# Author    :"wangjunlin"
from utils import call
from app import models
from django.db import connection
import cv2,os,datetime
# import face_recognition

def now_time():
    n_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return n_time

def query_authority(acc):
    id = []
    cur = connection.cursor()
    cur.execute("select menu_id from sys_role_menu where role_id in(select rle_id from sys_user_role where user_id in (select id from sys_user where account = %s))",[acc])
    role_obj = cur.fetchall()
    if len(role_obj) != 0:
        '''拥有角色权限—>查询菜单'''
        for role_id in role_obj:
            id.append(role_id[0])
        menu_list = call.create_menu (list (set (id)))
        cur.close()
        return menu_list
    else:
        '''没有角色权限，只有初级权限'''
        pass

def detail_user(request,uid):
    cur = connection.cursor()
    cur.execute("select id,account,name,gender,address,tell,email from sys_user where id = %s",[uid])
    user_data = cur.fetchall ()
    data = user_data[0]
    call.create_log (request, 'select', '查看用户', user_data[0][2])
    cur.close()
    return data

def P_role(request):
    cur = connection.cursor()
    role_base = request.POST.get ('key', None)
    user_base = request.POST.get ('base', None)
    user_base = eval(user_base)
    role_base = eval(role_base)
    cur.execute("select menu_id,role_name from sys_role_menu where role_id = %s",[role_base[0]])
    ro_data = cur.fetchall()
    data_list = []
    for d in ro_data:
        data_list.append(d[0])
    for r in user_base:
        if r in data_list:
            data_list.remove(r)
        else:
            cur.execute ("select id,caption from sys_menu where id = %s", [r])
            cd_data = cur.fetchall ()
            cd_list = list(cd_data[0])
            cur.execute ("insert into sys_role_menu (id,role_id,role_name,menu_id,menu_name) values (%s,%s,%s,%s,%s)",
                         [call.uid(),role_base[0], role_base[1], cd_list[0], cd_list[1]])
    for more in data_list:
        cur.execute("delete from sys_role_menu where role_id = %s and menu_id = %s",[role_base[0],more])
    cur.execute("select caption from sys_role where id = %s",[role_base[0]])
    r_cpa = cur.fetchall()
    call.create_log (request, 'update', '更新角色菜单', r_cpa[0][0])
    cur.close()

def G_role(u_id):
    re_list = []
    ex_list = []
    cur = connection.cursor()
    cur.execute ("select menu_id from sys_role_menu where role_id = %s", [u_id])
    ex_id = cur.fetchall ()
    for ex in ex_id:
        ex_list.append (ex[0])
    # 查询所有的菜单并组装菜单树
    role_obj = models.SysMenu.objects.filter (pid=0).order_by('order')
    ex_pid = []
    for ro in role_obj.values ('id', 'caption'):
        id_obj = models.SysMenu.objects.filter (pid=ro['id']).order_by('order')
        id_list = []
        for id in id_obj.values ('id', 'caption'):
            id_dic = {}
            ex_pid.append(ro['id'])
            id_dic['title'] = id['caption']
            id_dic['id'] = id['id']
            id_dic['spread'] = 'true'
            if id['id'] in ex_list:
                id_dic['checked'] = 'true'
            id_list.append (id_dic)
        re_dic = {}
        if ro['id'] not in ex_pid and ro['id'] in ex_list:
            re_dic['checked'] = 'true'
        re_dic['id'] = ro['id']
        re_dic['title'] = ro['caption']
        re_dic['field'] = ''
        re_dic['spread'] = 'true'
        re_dic['children'] = id_list
        re_list.append (re_dic)
    cur.close()
    return re_list

def tree(request):
    t_number = 0
    data_dic = {}
    re_list = []
    # 查询所有的菜单并组装菜单树,并排序
    role_obj = models.SysMenu.objects.filter (pid=0).order_by ('order')
    data_dic['msg'] = True
    data_dic['code'] = 0
    for ro in role_obj.values ('id', 'caption','lcon','url','order','pid','remark'):
        t_number += 1
        re_dic = {}
        re_dic['id'] = ro['id']
        re_dic['orderid'] = t_number
        re_dic['caption'] = ro['caption']
        re_dic['lcon'] = ro['lcon']
        re_dic['url'] = ro['url']
        re_dic['order'] = ro['order']
        re_dic['pid'] = ro['pid']
        re_dic['remark'] = ro['remark']
        re_list.append(re_dic)
        id_obj = models.SysMenu.objects.filter (pid=ro['id']).order_by ('order')
        for id in id_obj.values ('id', 'caption','lcon','url','order','pid','remark'):
            t_number += 1
            id_dic = {}
            id_dic['id'] = id['id']
            id_dic['orderid'] = t_number
            id_dic['caption'] = id['caption']
            id_dic['lcon'] = id['lcon']
            id_dic['url'] = id['url']
            id_dic['order'] = id['order']
            id_dic['pid'] = id['pid']
            id_dic['remark'] = id['remark']
            re_list.append (id_dic)
    data_dic['count'] = len (re_list)
    data_dic['data'] = re_list
    return data_dic

def G_roleid(request):
    role_id = []
    cur = connection.cursor()
    cur.execute ("select id from sys_menu order by id")
    ro_id = cur.fetchall ()
    for re in ro_id:
        role_id.append(re[0])
    cur.close()
    return role_id

def ex_jc(request,cap):
    flag = cap.isOpened()
    '''临时目录路径'''
    temp_path = models.SysImageSetting.objects.filter(edition=1)
    for tmp in temp_path.values('temp_path', 'dqsj', 'path', 'cjcs'):
        dir_path = list(tmp.values())[0]
        tep_jgsj = list(tmp.values())[1]
        path = list(tmp.values())[2]
        lrcs = list(tmp.values())[3]
    ex_path = os.path.exists(dir_path)
    if ex_path == False:
        os.mkdir(dir_path)
    start_time = datetime.datetime.now()
    while (flag):
        ret, frame = cap.read()
        cv2.imshow("Capture_Paizhao", frame)
        end_time = datetime.datetime.now()
        cv2.waitKey(1) & 0xFF
        if (end_time - start_time).seconds >= tep_jgsj:
            cv2.imencode('.jpg', frame)[1].tofile(dir_path + 'image' + '.jpg')
            break
    cap.release()
    cv2.destroyAllWindows()
    list1_name = []
    images_base = []
    ex_path1 = os.path.exists(path)
    if ex_path1 == False:
        os.mkdir(path)
    list_p = os.listdir(path)
    for p in range(0, len(list_p)):
        list_name = []
        filename1 = os.path.splitext(list_p[p])[0]
        path_c = path + filename1 + '/'
        list1_name.append(filename1)
        list_one = os.listdir(path_c)
        if len(list_one) == lrcs:
            for i1 in range(0, lrcs):
                filename = ''.join(os.path.splitext(list_one[i1]))
                list_name.append(filename)
        else:
            list1_name.remove(filename1)
        # for i2 in list_name:
            # exist_image = face_recognition.load_image_file(path_c + str(i2))
            # jobs_encoding = face_recognition.face_encodings(exist_image)[0]
            # images_base.append(jobs_encoding)
    # current_image = face_recognition.load_image_file(dir_path + 'image.jpg')
    # try:
        # current_encoding = face_recognition.face_encodings(current_image)[0]
        # results = face_recognition.compare_faces(images_base, current_encoding)
        # for r in range(0, len(results)):
        #     if results[r] == True:
        #         login_account = list1_name[int(r / lrcs)]
        #         account_search = models.SysUser.objects.filter(account=login_account)
        #         for mode_ures in account_search.values('pwd', 'level', 'name'):
        #             request.session['acc'] = login_account
        #             request.session['u'] = list(mode_ures.values())[2]
        #             request.session['level'] = list(mode_ures.values())[1]
        #             request.session['is_login'] = True
        #             request.session.set_expiry(60 * 60)
        #             models.SysLog.objects.create(id=call.uid(), accout=login_account, name=list(mode_ures.values())[2],
        #                                          type='login',
        #                                          time=now_time(), content=list(mode_ures.values())[2] + '使用人脸识别登录系统')
        #         return True
        #     if True not in results:
        #         return False
    # except:
    #     return None

def face_login(request):
    try:
        cap = cv2.VideoCapture(0)
        base = ex_jc(request, cap)
        return base
    except:
        try:
            cap = cv2.VideoCapture(1)
            base = ex_jc(request, cap)
            return base
        except:
            return 'No_cameras'