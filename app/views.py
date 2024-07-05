from django.shortcuts import render,redirect,HttpResponse
from app import models
import datetime,hashlib
# Create your views here.
from utils import call
from utils import query
from utils import user_page
from django.shortcuts import render,redirect
from django.shortcuts import HttpResponse
import json,uuid
from utils import chart_base,system,history_page,security_page,my_sql,reptile_down
from app import models
from django.db import connection

# chart_base.delete()
# chart_base.creat_path()


def now_time():
    n_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return n_time

def uid():
    uid = str (uuid.uuid1())
    suid = ''.join (uid.split ('-'))
    return suid

def login(request):
    if request.method == 'POST':
        dlfs = request.POST.get('key',None)
        if dlfs == 'login':
            user = request.POST.get('account',None)
            pwd = request.POST.get('password',None)
            print(pwd)
            in_dense = hashlib.md5 ()
            in_dense.update (pwd.encode (encoding='utf-8'))
            if user == '' or pwd == '':
                return HttpResponse(json.dumps(None))
            else:
                mim = models.SysUser.objects.filter(account=user)
                for i in mim.values('pwd','level','name'):
                    in_pwd = list(i.values())[0]
                if len(mim)==0 or in_pwd != in_dense.hexdigest():
                    return HttpResponse(json.dumps(False))
                else:
                    request.session['acc'] = user
                    request.session['u'] = list(i.values())[2]
                    request.session['level'] = list(i.values())[1]
                    request.session['is_login'] = True
                    request.session.set_expiry (60*1)
                    models.SysLog.objects.create(id=call.uid(),accout = user,name = list(i.values())[2],type = 'login',time = now_time(),content = list(i.values())[2] + '登录系统')
                    return HttpResponse(json.dumps(True))
        elif dlfs == 'face':
            qyzt = models.SysImageSetting.objects.filter(edition=1)
            for zt in qyzt.values('sfqy'):
                if zt['sfqy'] == 1:
                    data = query.face_login(request)
                    return HttpResponse(json.dumps(data))
                else:
                    return HttpResponse(json.dumps('server_stop'))
        else:
            return redirect ('/login.html')
    session_key=request.session.session_key
    request.session.delete(session_key)
    return render(request,'system/login.html')

def index(request):
    if call.is_login (request):
        username = request.session['u']
        account = request.session['acc']
        lev = request.session['level']
        m_list = query.query_authority(account)
        return render (request, 'system/index.html', {'account': username, 'level': lev, 'm_list':m_list})
    else:
        return redirect ('/login.html')

def role(request):
    if call.is_login (request):
        return render (request, 'system/role.html')
    else:
        return redirect ('/login.html')

def role_insert(request):
    if call.is_login (request):
        if request.method == 'POST':
            temp = request.POST
            models.SysRole.objects.create (id=call.uid(),caption = temp['base[name]'],abbreviation = temp['base[level]'],remark = temp['base[remark]'])
            call.create_log(request,'create','创建角色',temp['base[name]'])
            return HttpResponse(json.dumps (True))
        else:
            return render(request, 'system/role_insert.html')
    else:
        return redirect ('/login.html')

def role_edit(request):
    if call.is_login (request):
        if request.method == 'POST':
            temp = request.POST
            models.SysRole.objects.filter (id=temp['base[id]']).update(caption = temp['base[name]'],abbreviation = temp['base[level]'],remark = temp['base[remark]'])
            call.create_log (request, 'update', '修改角色', temp['base[name]'])
            return HttpResponse(json.dumps (True))
        else:
            role_id = request.GET.get('role_id',None)
            role_obj = models.SysRole.objects.filter(id = role_id)
            call.create_log (request, 'select', '查看角色', role_obj.values()[0]['caption'])
            role_base = list(role_obj.values_list()[0])
            return render (request, 'system/role_edit.html', {'role_base':role_base})
    else:
        return redirect ('/login.html')

def role_del(request):
    if call.is_login (request):
        if request.method == 'POST':
            cur = connection.cursor()
            re_id = request.POST
            cur.execute ("delete from sys_role_menu where role_id = %s", [re_id['base']])
            cur.execute ("delete from sys_user_role where rle_id = %s", [re_id['base']])
            cur.execute ("delete from sys_role where id = %s", [re_id['base']])
            call.create_log (request, 'delete', '删除角色', re_id['ro_name'])
            cur.close()
        return HttpResponse (json.dumps (True))
    else:
        return redirect ('login.html')

def role_menu(request):
    if call.is_login (request):
        if request.method == 'POST':
            query.P_role (request)
            return HttpResponse (json.dumps (True))
        else:
            # 查询当前角色拥有的菜单权限
            ro_id = request.GET.get ('role_id', None)
            ro_name = request.GET.get ('role_name', None)
            ro_base = [ro_id, ro_name]
            re_list = query.G_role (ro_id)
            role_id = query.G_roleid (request)
            return render (request, 'system/role_menu.html', {'data': re_list, 'ro_base': ro_base, 'role_id':role_id})
    else:
        return redirect ('/login.html')

def role_user(request):
    if call.is_login (request):
        if request.method == 'POST':
            user_page.role_user (request)
            return HttpResponse (json.dumps (True))
        else:
            role_id = request.GET.get ('role_id', None)
            role_name = request.GET.get ('role_name', None)
            role_base = [role_id, role_name]
            return render (request, 'system/role_user.html', {'role_base': role_base})
    else:
        return redirect ('/login.html')

def role_data(request):
    # 角色页面数据接口
    if call.is_login (request):
        data = user_page.role_data(request)
        return HttpResponse(json.dumps(data))
    else:
        return redirect ('/login.html')

def user_detail(request):
    if call.is_login (request):
        u_id = request.GET.get ('role_id', None)
        data = query.detail_user(request,u_id)
        ex_data = call.ex_btn(u_id)
        return render(request, 'system/user_detail.html', {'data':data, 'ex_data':ex_data})
    else:
        return redirect ('/login.html')

def user(request):
    if call.is_login (request):
        return render (request, 'system/user.html')
    else:
        return redirect ('/login.html')

def user_insert(request):
    if call.is_login (request):
        if request.method == 'POST':
            u_data = call.inser_user(request)
            return HttpResponse(json.dumps(u_data))
        else:
            base = call.create_tree ()
            return render (request, 'system/user_insert.html', {'data':base})
    else:
        return redirect ('/login.html')

def user_data(request):
    # 用户管理数据接口
    if call.is_login (request):
        value = request.GET.get ('0', None)
        search = request.GET.get ('keyword', None)
        result = user_page.user_page (request, value,search)
        return HttpResponse(json.dumps(result))
    else:
        return redirect ('/login.html')

def user_edit(request):
    if call.is_login (request):
        if request.method == 'POST':
            data = call.edit_user(request)
            return HttpResponse(json.dumps(data))
        else:
            user_id = request.GET.get ('user_id', None)
            cid = models.SysUser.objects.get (id=user_id)
            data = call.create_tree()
            ex_data = call.ex_data(user_id)
            return render(request, 'system/user_edit.html', {'acc':cid.account, 'id':user_id, 'name':cid.name, 'gender':cid.gender, 'address':cid.address, 'email':cid.email, 'tell':cid.tell, 'data':data, 'ex_data':ex_data})
    else:
        return redirect ('/login.html')

def user_del(request):
    if call.is_login (request):
        if request.method == 'POST':
            key = request.POST.get ('key', None)
            if key == 'delete':
                cur = connection.cursor()
                user_id = request.POST.get ('ID', None)
                user_name = request.POST.get ('name', None)
                cur.execute ("delete from sys_user_role where user_id = %s", [user_id])
                cur.execute ("delete from sys_user where id = %s", [user_id])
                call.create_log (request, 'delete', '删除用户', user_name)
                cur.close()
                return HttpResponse (json.dumps (True))
    else:
        return redirect('/login.html')

def menu(request):
    if call.is_login (request):
        return render(request, 'system/menu.html')
    else:
        return redirect ('/login.html')

def menu_insert(request):
    if call.is_login (request):
        if request.method =='POST':
            role_id = request.POST
            models.SysMenu.objects.create (caption=role_id['base[p_name]'],order=role_id['base[order]'] ,lcon=role_id['base[font]'],url=role_id['base[link]'],pid=role_id['key'],remark=role_id['base[remark]'])
            call.create_log (request, 'create', '创建菜单', role_id['base[p_name]'])
            return HttpResponse(json.dumps(True))
        else:
            menu_dic = {}
            menu_obj = models.SysMenu.objects.filter(pid=0)
            for m in menu_obj.values('id', 'caption'):
                menu_dic[m['id']] = m['caption']
            menu_dic['0'] = 'ROOT'
            return render(request, 'system/menu_insert.html', {'menu_dic':menu_dic})
    else:
        return redirect ('/login.html')

def menu_detail(request):
    if call.is_login (request):
        menu_id = request.GET.get ('menu_id', None)
        m_base = models.SysMenu.objects.filter (id=menu_id)
        base = m_base.values ()
        call.create_log (request, 'select', '查看菜单', base[0]['caption'])
        if base[0]['pid'] != 0:
            p_sql = models.SysMenu.objects.filter (id=base[0]['pid'])
            p_base = p_sql.values ()
            p_name = p_base[0]['caption']
        else:
            p_name = 'ROOT'
        return render (request, 'system/menu_detail.html', {'p_name': p_name, 'data': base[0]})
    else:
        return redirect ('/login.html')

def menu_edit(request):
    if call.is_login (request):
        if request.method == 'POST':
            menu_base = request.POST
            models.SysMenu.objects.filter(id=menu_base['base[menu_id]']).update(caption=menu_base['base[p_name]'],order=menu_base['base[order]'],lcon=menu_base['base[font]'],url=menu_base['base[link]'],pid=menu_base['key'],remark=menu_base['base[remark]'])
            call.create_log (request, 'update', '编辑菜单', menu_base['base[p_name]'])
            return HttpResponse (json.dumps (True))
        else:
            data = user_page.menu(request)
            return render(request, 'system/menu_edit.html', data)
    else:
        return redirect ('/login.html')

def menu_del(request):
    if call.is_login (request):
        menu_base = request.POST
        cur = connection.cursor()
        count = cur.execute("select id from sys_menu where pid = %s",[menu_base['base']])
        if count > 0:#有子菜单
            return HttpResponse (json.dumps (False))
        else:#没有子菜单
            cur.execute ("delete from sys_role_menu where menu_id = %s", [menu_base['base']])
            cur.execute ("delete from sys_menu where id = %s", [menu_base['base']])
            call.create_log (request, 'delete', '删除菜单', menu_base['m_name'])
        cur.close()
        return HttpResponse(json.dumps(True))
    else:
        return redirect ('/login.html')

def menu_data(request):
    if call.is_login (request):
        data = query.tree (request)
        return HttpResponse(json.dumps(data))
    else:
        return redirect ('/login.html')

def log(request):
    if call.is_login (request):
        log_obj = models.SysLog.objects.values('type').distinct()
        ty_li = []
        for l in log_obj.values('type'):
            ty_li.append(l['type'])
        return render(request, 'system/log.html', {'log_base':ty_li})
    else:
        return redirect ('/login.html')

def log_data(request):
    if call.is_login (request):
        data = user_page.log_page(request)
        return HttpResponse (json.dumps (data))
    else:
        return redirect ('/login.html')

def position(request):
    if call.is_login (request):
        data = call.create_tree()
        return render(request, 'system/position.html', {'data':data})
    else:
        return redirect ('/login.html')

def org_add(request):
    if call.is_login (request):
        if request.method == 'POST':
            n_base = request.POST
            ex_val = models.SysOrg.objects.filter(org_code=n_base['base[Code]'])
            if len(ex_val)==0:
                models.SysOrg.objects.create(id = uid(),org_code=n_base['base[Code]'],org_name=n_base['base[name]'],pid=n_base['base[PID]'],remark=n_base['base[remark]'])
                call.create_log (request, 'insert', '新增部门', n_base['base[name]'])
                return HttpResponse(json.dumps(True))
            else:
                return HttpResponse(json.dumps(False))
        else:
            org_id = request.GET.get ('org_id', None)
            org_val = models.SysOrg.objects.filter (id=org_id)
            for org in org_val.values ():
                return render(request, 'system/org_add.html', {'org_name':org['org_name'], 'org_id':org['id']})
    else:
        return redirect ('/login.html')

def org_edit(request):
    if call.is_login (request):
        if request.method == 'POST':
            n_base = request.POST
            models.SysOrg.objects.filter (org_code=n_base['base[Code]']).update (org_name=n_base['base[name]'], remark=n_base['base[remark]'])
            call.create_log (request, 'update', '编辑部门',n_base['base[name]'])
            return HttpResponse (json.dumps (True))
        else:
            org_id = request.GET.get ('org_id', None)
            org_val = models.SysOrg.objects.filter (id=org_id)
            for org in org_val.values ():
                if org['pid'] != '0':
                    p_val = models.SysOrg.objects.filter (id=org['pid'])
                    for p in p_val.values ():
                        pass
                else:
                    p = org
            return render (request, 'system/org_edit.html', {'pid': org['pid'], 'p_name': p['org_name'], 'org_name': org['org_name'], 'org_code':org['org_code'], 'remark':org['remark']})
    else:
        return redirect ('/login.html')

def org_del(request):
    if call.is_login (request):
        del_base = request.POST
        del_obj = models.SysOrg.objects.filter(pid=del_base['base'])
        if len(del_obj)>0:
            return HttpResponse(json.dumps(False))
        else:
            models.SysOrg.objects.filter(id=del_base['base']).delete ()
            models.SysUserOrg.objects.filter(org_id=del_base['base']).delete ()
            return HttpResponse(json.dumps(True))
        return render(request,'org_del.html')
    else:
        return redirect ('/login.html')

def org_data(request):
    if call.is_login (request):
        result = user_page.org_data (request)
        return HttpResponse(json.dumps(result))
    else:
        return redirect ('/login.html')

def chart(request):
    if call.is_login(request):
        if request.method == 'POST':
            key = request.POST.get ('key', None)
            if key == 'CPU':
                dic = chart_base.chart()
                return HttpResponse (json.dumps(dic))
        else:
            cpu_list = chart_base.cpu()
            mem_list = chart_base.memory()
            d_list = chart_base.disk()
            byte_work = chart_base.byte_work()
            num_work = chart_base.num_work()
            disk_count = chart_base.disk_detail()[0:2]
            disk_byte = chart_base.disk_detail()[2:4]
            disk_time = chart_base.disk_detail()[4:]
            return render (request, 'docs/chart.html',
                           {'date': json.dumps (cpu_list), 'memory': json.dumps (mem_list), 'disk': json.dumps (d_list),
                            'network': json.dumps (byte_work),'num_work': json.dumps (num_work), 'disk_count':  json.dumps(disk_count), 'disk_byte':  json.dumps(disk_byte), 'disk_time':  json.dumps(disk_time)})
    else:
        return redirect('/index.html')

def Hardware(request):
    if call.is_login(request):
        return render (request, 'docs/Hardware.html')
    else:
        return redirect('/login.html')

def Hardware_data(request):
    if call.is_login (request):
        total_list = system.summary (request)
        return HttpResponse (json.dumps (total_list))
    else:
        return redirect ('/login.html')

def process(request):
    global search
    if call.is_login(request):
        if request.method == 'POST':
            pid = request.POST.get ('base', None)
            relay = system.kill_proc_tree(pid)
            return HttpResponse (json.dumps (relay))
        else:
            return render (request, 'docs/process.html')
    else:
        return redirect('/login.html')

def process_data(request):
    if call.is_login (request):
        process_base = system.process_page (request)
        return HttpResponse (json.dumps (process_base))
    else:
        return redirect ('/login.html')

def history(request):
    if call.is_login(request):
        result = history_page.history_page(request)
        return render (request, 'docs/chart_history.html', result)
    else:
        return redirect('/login.html')

def analysis(request):
    list = {'base':[['cpu','80%','50%','正常'],['内存','80%','50%','正常'],['磁盘I/O','80%','50%','正常'],['网络带宽','80%','50%','正常']]}
    return render(request,'docs/data_analysis.html',list)

def usage(request):
    if call.is_login (request):
        return render(request,'docs/usage.html')
    else:
        return redirect('/login.html')

def usage_data(request):
    if call.is_login (request):
        con_user_dic = system.con_user (request)
        return HttpResponse (json.dumps (con_user_dic))
    else:
        return redirect ('/login.html')

def security(request):
    if call.is_login (request):
        result = security_page.run(request)
        return render (request, 'docs/security.html',result)
    else:
        return redirect('/login.html')

def mysql(request):
    if call.is_login (request):
        if request.method == 'POST':
            num = my_sql.constitute ()
            return HttpResponse (json.dumps (num))
        connect_num = my_sql.connect_one ()
        list_sql = my_sql.ex_sql ()
        sql_num = my_sql.ex_sql_num ()
        timeout = my_sql.table ()
        open_count = my_sql.num ()
        surface = my_sql.surface ()
        scan = my_sql.scan ()
        Percentage = my_sql.Percentage ()
        QT = my_sql.QT ()
        return render (request, 'docs/mysql.html',
                       {'base': list_sql, 'sql_num': sql_num, 'connect_num': connect_num, 'timeout': timeout,
                        'open_count': open_count, 'surface': surface, 'scan': scan, 'Percentage': Percentage, 'QT': QT})
    else:
        return redirect('/login.html')

def LAN(request):
    if call.is_login (request):
        result = system.ip_scan (request)
        return render(request,'docs/ip_scan.html',result)
    else:
        return redirect('/login.html')

def reptile(request):
    if call.is_login (request):
        if request.method == 'POST':
            data = reptile_down.data_cleaning()
            return HttpResponse(json.dumps(data))
        return render(request,'docs/reptile.html')
    else:
        return redirect('/login.html')

def reptile_base(request):
    page_num = int (request.GET.get ('page', 1))
    bg_hs = int (request.GET.get ('limit', 10))
    search = request.GET.get ('keyword', None)
    search_base = reptile_down.search_reptile (page_num,bg_hs,search)
    print('search_base',search_base)
    return HttpResponse(json.dumps (search_base))
    return HttpResponse(json.dumps (search_base))

def face_gather(request):
    if call.is_login (request):
        if request.method == 'POST':
            fhjg =call.face_cj(request)
            return HttpResponse(json.dumps(fhjg))
        else:
            text_dic = {}
            set_text = models.SysImageSetting.objects.filter(edition=1)
            for set in set_text.values():
                for s,k in set.items():
                    text_dic[s] = k
            if text_dic['sfqy'] == 1:
                text_dic['sfqy'] = '''<input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">'''
            else:
                text_dic['sfqy'] = '''<input type="checkbox"  name="close" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">'''
            return render(request,'system/face_gather.html',text_dic)
    else:
        return redirect ('/login.html')