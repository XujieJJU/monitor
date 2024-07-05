# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Conversion(models.Model):
    initial = models.CharField(max_length=255, blank=True, null=True)
    exchange_rate = models.FloatField(blank=True, null=True)
    target = models.CharField(max_length=255, blank=True, null=True)
    abbreviation = models.CharField(max_length=255, blank=True, null=True)
    remarks = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'conversion'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class SysHistory(models.Model):
    datetime = models.CharField(max_length=255, blank=True, null=True)
    cpu = models.CharField(max_length=255, blank=True, null=True)
    memory = models.CharField(max_length=255, blank=True, null=True)
    network = models.CharField(max_length=255, blank=True, null=True)
    disk_detail = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_history'


class SysImageSetting(models.Model):
    edition = models.IntegerField(primary_key=True)
    path = models.CharField(max_length=126)
    temp_path = models.CharField(max_length=126, blank=True, null=True)
    cjcs = models.IntegerField(blank=True, null=True)
    jgsj = models.IntegerField(blank=True, null=True)
    dqsj = models.IntegerField(blank=True, null=True)
    sfqy = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_image_setting'


class SysLog(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    accout = models.CharField(max_length=32, blank=True, null=True)
    name = models.CharField(max_length=32, blank=True, null=True)
    type = models.CharField(max_length=32, blank=True, null=True)
    time = models.CharField(max_length=32, blank=True, null=True)
    content = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_log'


class SysMenu(models.Model):
    order = models.IntegerField(blank=True, null=True)
    caption = models.CharField(max_length=32, blank=True, null=True)
    lcon = models.CharField(max_length=32, blank=True, null=True)
    url = models.CharField(max_length=128, blank=True, null=True)
    pid = models.IntegerField(blank=True, null=True)
    remark = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_menu'


class SysOrg(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    org_name = models.CharField(max_length=32, blank=True, null=True)
    org_code = models.CharField(max_length=128, blank=True, null=True)
    pid = models.CharField(max_length=32, blank=True, null=True)
    remark = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_org'


class SysRole(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    caption = models.CharField(max_length=32, blank=True, null=True)
    abbreviation = models.CharField(max_length=32, blank=True, null=True)
    remark = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_role'


class SysRoleMenu(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    role_id = models.CharField(max_length=32, blank=True, null=True)
    role_name = models.CharField(max_length=32, blank=True, null=True)
    menu_id = models.IntegerField(blank=True, null=True)
    menu_name = models.CharField(max_length=32, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_role_menu'


class SysUser(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    name = models.CharField(max_length=32, blank=True, null=True)
    pwd = models.CharField(max_length=32, blank=True, null=True)
    email = models.CharField(max_length=64, blank=True, null=True)
    account = models.CharField(max_length=32, blank=True, null=True)
    tell = models.CharField(max_length=32, blank=True, null=True)
    address = models.CharField(max_length=32, blank=True, null=True)
    level = models.CharField(max_length=32, blank=True, null=True)
    gender = models.CharField(max_length=32, blank=True, null=True)
    sfcj = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'sys_user'


class SysUserOrg(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    org_id = models.CharField(max_length=32, blank=True, null=True)
    org_name = models.CharField(max_length=64, blank=True, null=True)
    user_id = models.CharField(max_length=32, blank=True, null=True)
    user_name = models.CharField(max_length=64, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_user_org'


class SysUserRole(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    rle_id = models.CharField(max_length=32, blank=True, null=True)
    rle_name = models.CharField(max_length=32, blank=True, null=True)
    user_id = models.CharField(max_length=32, blank=True, null=True)
    user_name = models.CharField(max_length=32, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sys_user_role'
