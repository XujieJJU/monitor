"""manager URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path

from app import views

urlpatterns = [
    # path('admin/', admin.site.urls),
    re_path (r'^$',views.login),
    re_path (r'^index.html', views.index),
    re_path (r'^login.html', views.login),
    re_path (r'^role.html', views.role),
    re_path (r'^role_user.html', views.role_user),
    re_path (r'^role_insert.html', views.role_insert),
    re_path (r'^role_edit.html', views.role_edit),
    re_path (r'^role_del.html', views.role_del),
    re_path (r'^role_menu.html', views.role_menu),
    re_path (r'^menu_edit.html', views.menu_edit),
    re_path (r'^menu.html', views.menu),
    re_path (r'^menu_insert.html', views.menu_insert),
    re_path (r'^menu_detail.html', views.menu_detail),
    re_path (r'^menu_del.html', views.menu_del),
    re_path (r'^user.html', views.user),
    re_path (r'^user_insert.html', views.user_insert),
    re_path (r'^user_detail.html', views.user_detail),
    re_path (r'^user_edit.html', views.user_edit),
    re_path (r'^user_del.html', views.user_del),
    re_path (r'^user_data.html', views.user_data),
    re_path (r'^role_data.html', views.role_data),
    re_path (r'^menu_data.html', views.menu_data),
    re_path (r'^log.html', views.log),
    re_path (r'^log_data.html', views.log_data),
    re_path (r'^position.html', views.position),
    re_path (r'^org_add.html', views.org_add),
    re_path (r'^org_edit.html', views.org_edit),
    re_path (r'^org_del.html', views.org_del),
    re_path (r'^org_data.html', views.org_data),
    re_path (r'^chart.html', views.chart),
    re_path (r'^Hardware.html', views.Hardware),
    re_path (r'^Hardware_data.html', views.Hardware_data),
    re_path (r'^process.html', views.process),
    re_path (r'^process_data.html', views.process_data),
    re_path (r'^history.html', views.history),
    re_path (r'^usage.html', views.usage),
    re_path (r'^usage_data.html', views.usage_data),
    re_path (r'^security.html', views.security),
    re_path (r'^mysql.html', views.mysql),
    re_path (r'^ip_scan.html', views.LAN),
    re_path (r'^reptile.html', views.reptile),
    re_path (r'^reptile_base.html', views.reptile_base),
    re_path (r'^face_gather.html', views.face_gather),
]
