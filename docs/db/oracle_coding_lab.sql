/*
 * Copyright 2019-2029 osalien(https://github.com/osalien)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

create table IP
(
    ID           NUMBER(20)    not null
        constraint IP_PK
        primary key,
    IP_START     VARCHAR2(15)  not null,
    IP_END       VARCHAR2(15)  not null,
    AREA         VARCHAR2(100) not null,
    OPERATOR     VARCHAR2(200) not null,
    IP_START_NUM NUMBER(20)    not null,
    IP_END_NUM   NUMBER(20)    not null
)
    /

create table SYS_LOG
(
    LOG_ID      NUMBER(20) not null
        constraint SYS_LOG_PK
        primary key,
    TYPE        NUMBER(1),
    CONTENT     VARCHAR2(255),
    CREATE_ID   NUMBER(20),
    CREATE_TIME DATE default sysdate
)
    /

comment on table SYS_LOG is '系统日志'
/

comment on column SYS_LOG.LOG_ID is '主键'
/

comment on column SYS_LOG.CONTENT is '内容'
/

comment on column SYS_LOG.CREATE_ID is '创建人ID'
/

comment on column SYS_LOG.CREATE_TIME is '创建时间'
/

create table FOO_BAR
(
    ID          NUMBER(20)   not null
        constraint FOO_BAR_PK
        primary key,
    NAME        VARCHAR2(20) not null,
    FOO         VARCHAR2(20),
    BAR         VARCHAR2(20) not null,
    REMARK      VARCHAR2(200),
    STATE       NUMBER(11) default '1',
    VERSION     NUMBER(11) default '0',
    CREATE_TIME DATE       default sysdate,
    UPDATE_TIME DATE
)
    /

comment on table FOO_BAR is 'FooBar'
/

comment on column FOO_BAR.ID is '主键'
/

comment on column FOO_BAR.NAME is '名称'
/

comment on column FOO_BAR.FOO is 'Foo'
/

comment on column FOO_BAR.BAR is 'Bar'
/

comment on column FOO_BAR.REMARK is '备注'
/

comment on column FOO_BAR.STATE is '状态，0：禁用，1：启用'
/

comment on column FOO_BAR.VERSION is '版本'
/

comment on column FOO_BAR.CREATE_TIME is '创建时间'
/

comment on column FOO_BAR.UPDATE_TIME is '修改时间'
/

create table SYS_DEPARTMENT
(
    ID          NUMBER(20)   not null,
    NAME        VARCHAR2(32) not null,
    PARENT_ID   NUMBER(20),
    "LEVEL"     NUMBER(2),
    STATE       NUMBER(11) default '1',
    SORT        NUMBER(11) default '0',
    REMARK      VARCHAR2(200),
    VERSION     NUMBER(11) default '0',
    CREATE_TIME DATE       default sysdate,
    UPDATE_TIME DATE
)
    /

comment on table SYS_DEPARTMENT is '部门'
/

comment on column SYS_DEPARTMENT.ID is '主键'
/

comment on column SYS_DEPARTMENT.NAME is '部门名称'
/

comment on column SYS_DEPARTMENT.PARENT_ID is '父id'
/

comment on column SYS_DEPARTMENT."LEVEL" is '部门层级'
/

comment on column SYS_DEPARTMENT.STATE is '状态，0：禁用，1：启用'
/

comment on column SYS_DEPARTMENT.SORT is '排序'
/

comment on column SYS_DEPARTMENT.REMARK is '备注'
/

comment on column SYS_DEPARTMENT.VERSION is '版本'
/

comment on column SYS_DEPARTMENT.CREATE_TIME is '创建时间'
/

comment on column SYS_DEPARTMENT.UPDATE_TIME is '修改时间'
/

create unique index SYS_DEPARTMENT_NAME_UINDEX
    on SYS_DEPARTMENT (NAME)
    /

create table SYS_USER
(
    ID            NUMBER(20)   not null
        constraint SYS_USER_PK
        primary key,
    USERNAME      VARCHAR2(20) not null,
    NICKNAME      VARCHAR2(20),
    PASSWORD      VARCHAR2(64) not null,
    SALT          VARCHAR2(32),
    PHONE         VARCHAR2(20) not null,
    GENDER        NUMBER(11) default '1',
    HEAD          VARCHAR2(200),
    REMARK        VARCHAR2(200),
    STATE         NUMBER(11) default '1',
    DEPARTMENT_ID NUMBER(20)   not null,
    ROLE_ID       NUMBER(20)   not null,
    DELETED       NUMBER(11) default '0',
    VERSION       NUMBER(11) default '0',
    CREATE_TIME   DATE       default sysdate,
    UPDATE_TIME   DATE
)
    /

comment on table SYS_USER is '系统用户'
/

comment on column SYS_USER.ID is '主键'
/

comment on column SYS_USER.USERNAME is '用户名'
/

comment on column SYS_USER.NICKNAME is '昵称'
/

comment on column SYS_USER.PASSWORD is '密码'
/

comment on column SYS_USER.SALT is '盐值'
/

comment on column SYS_USER.PHONE is '手机号码'
/

comment on column SYS_USER.GENDER is '性别，0：女，1：男，默认1'
/

comment on column SYS_USER.HEAD is '头像'
/

comment on column SYS_USER.REMARK is 'remark'
/

comment on column SYS_USER.STATE is '状态，0：禁用，1：启用，2：锁定'
/

comment on column SYS_USER.DEPARTMENT_ID is '部门id'
/

comment on column SYS_USER.ROLE_ID is '角色id'
/

comment on column SYS_USER.DELETED is '逻辑删除，0：未删除，1：已删除'
/

comment on column SYS_USER.VERSION is '版本'
/

comment on column SYS_USER.CREATE_TIME is '创建时间'
/

comment on column SYS_USER.UPDATE_TIME is '修改时间'
/

create index SYS_USER_USERNAME_INDEX
    on SYS_USER (USERNAME)
    /

create table SYS_ROLE
(
    ID          NUMBER(20)    not null,
    NAME        VARCHAR2(32)  not null,
    CODE        VARCHAR2(100) not null,
    TYPE        NUMBER(11),
    STATE       NUMBER(11) default '1',
    REMARK      VARCHAR2(200),
    VERSION     NUMBER(11) default '0',
    CREATE_TIME DATE       default sysdate,
    UPDATE_TIME DATE
)
    /

comment on table SYS_ROLE is '系统角色'
/

comment on column SYS_ROLE.ID is '主键'
/

comment on column SYS_ROLE.NAME is '角色名称'
/

comment on column SYS_ROLE.CODE is '角色唯一编码'
/

comment on column SYS_ROLE.TYPE is '角色类型'
/

comment on column SYS_ROLE.STATE is '角色状态，0：禁用，1：启用'
/

comment on column SYS_ROLE.REMARK is '备注'
/

comment on column SYS_ROLE.VERSION is '版本'
/

comment on column SYS_ROLE.CREATE_TIME is '创建时间'
/

comment on column SYS_ROLE.UPDATE_TIME is '修改时间'
/

create unique index SYS_ROLE_NAME_INDEX
    on SYS_ROLE (NAME)
    /

create unique index SYS_ROLE_CODE_UINDEX
    on SYS_ROLE (CODE)
    /

create table SYS_PERMISSION
(
    ID          NUMBER(20)    not null
        constraint SYS_PERMISSION_PK
        primary key,
    NAME        VARCHAR2(32),
    PARENT_ID   NUMBER(20),
    URL         VARCHAR2(200),
    CODE        VARCHAR2(100) not null,
    ICON        VARCHAR2(100),
    TYPE        NUMBER(11)    not null,
    "LEVEL"     NUMBER(11)    not null,
    STATE       NUMBER(11) default '1',
    SORT        NUMBER(11) default '0',
    REMARK      VARCHAR2(200),
    VERSION     NUMBER(11) default '0',
    CREATE_TIME DATE       default sysdate,
    UPDATE_TIME DATE
)
    /

comment on table SYS_PERMISSION is '系统权限'
/

comment on column SYS_PERMISSION.ID is '主键'
/

comment on column SYS_PERMISSION.NAME is '权限名称'
/

comment on column SYS_PERMISSION.PARENT_ID is '父id'
/

comment on column SYS_PERMISSION.URL is '路径'
/

comment on column SYS_PERMISSION.CODE is '唯一编码'
/

comment on column SYS_PERMISSION.ICON is '图标'
/

comment on column SYS_PERMISSION.TYPE is '类型，1：菜单，2：按钮'
/

comment on column SYS_PERMISSION."LEVEL" is '层级，1：第一级，2：第二级，N：第N级'
/

comment on column SYS_PERMISSION.STATE is '状态，0：禁用，1：启用'
/

comment on column SYS_PERMISSION.SORT is '排序'
/

comment on column SYS_PERMISSION.REMARK is '备注'
/

comment on column SYS_PERMISSION.VERSION is '版本'
/

comment on column SYS_PERMISSION.CREATE_TIME is '创建时间'
/

comment on column SYS_PERMISSION.UPDATE_TIME is '修改时间'
/

create index SYS_PERMISSION_CODE_INDEX
    on SYS_PERMISSION (CODE)
    /

create table SYS_ROLE_PERMISSION
(
    ID            NUMBER(20) not null
        constraint SYS_ROLE_PERMISSION_PK
        primary key,
    ROLE_ID       NUMBER(20) not null,
    PERMISSION_ID NUMBER(20) not null,
    STATE         NUMBER(11) default '1',
    REMARK        VARCHAR2(200),
    VERSION       NUMBER(11) default '0',
    CREATE_TIME   DATE       default sysdate,
    UPDATE_TIME   DATE
)
    /

comment on table SYS_ROLE_PERMISSION is '角色权限关系'
/

comment on column SYS_ROLE_PERMISSION.ID is '主键'
/

comment on column SYS_ROLE_PERMISSION.ROLE_ID is '角色id'
/

comment on column SYS_ROLE_PERMISSION.PERMISSION_ID is '权限id'
/

comment on column SYS_ROLE_PERMISSION.STATE is '状态，0：禁用，1：启用'
/

comment on column SYS_ROLE_PERMISSION.REMARK is '备注'
/

comment on column SYS_ROLE_PERMISSION.VERSION is '版本'
/

comment on column SYS_ROLE_PERMISSION.CREATE_TIME is '创建时间'
/

comment on column SYS_ROLE_PERMISSION.UPDATE_TIME is '修改时间'
/

create index SYS_ROLE_PERMISSION_ID_ID_IN
    on SYS_ROLE_PERMISSION (ROLE_ID, PERMISSION_ID)
    /


-- Create sequence
create sequence FOO_BAR_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;

create sequence IP_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;

create sequence SYS_DEPARTMENT_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;

create sequence SYS_LOG_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;

create sequence SYS_PERMISSION_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;

create sequence SYS_ROLE_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;

create sequence SYS_ROLE_PERMISSION_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;

create sequence SYS_USER_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
cache 20;



INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1, '管理部', null, 1, 1, 0, null, 0, TO_DATE('2019-10-25 09:46:49', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2, '技术部', null, 1, 1, 0, null, 0, TO_DATE('2019-11-01 20:45:43', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (20, '前端开发部', 2, 2, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (21, '后台开发部', 2, 2, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (22, '测试部', 2, 2, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (201, '前端一组', 20, 3, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (202, '前端二组', 20, 3, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (203, '后台一组', 21, 3, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (204, '后台二组', 21, 3, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_DEPARTMENT (ID, NAME, PARENT_ID, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (205, '测试一组', 22, 3, 1, 0, null, 0, TO_DATE('2019-11-01 20:48:38', 'YYYY-MM-DD HH24:MI:SS'), null);


INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1, '系统管理', null, null, 'system:management', null, 1, 1, 1, 0, null, 0, TO_DATE('2019-10-26 11:12:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (100, '用户管理', 1, null, 'sys:user:management', null, 1, 2, 1, 0, null, 0, TO_DATE('2019-10-26 11:15:48', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (200, '角色管理', 1, null, 'sys:role:management', null, 1, 2, 1, 0, null, 0, TO_DATE('2019-10-26 11:15:48', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (300, '权限管理', 1, null, 'sys:permission:management', null, 1, 2, 1, 0, null, 0, TO_DATE('2019-10-26 11:15:48', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (400, '部门管理', 1, null, 'sys:department:management', null, 1, 2, 1, 0, null, 0, TO_DATE('2019-10-26 11:15:48', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1000, '用户新增', 100, null, 'sys:user:add', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1001, '用户修改', 100, null, 'sys:user:update', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1002, '用户删除', 100, null, 'sys:user:delete', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1003, '用户详情', 100, null, 'sys:user:info', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1004, '用户分页列表', 100, null, 'sys:user:page', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1005, '用户修改密码', 100, null, 'sys:user:update:password', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1006, '用户修改头像', 100, null, 'sys:user:update:head', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2000, '角色新增', 200, null, 'sys:role:add', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2001, '角色修改', 200, null, 'sys:role:update', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2002, '角色删除', 200, null, 'sys:role:delete', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2003, '角色详情', 200, null, 'sys:role:info', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2004, '角色分页列表', 200, null, 'sys:role:page', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3000, '权限新增', 300, null, 'sys:permission:add', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3001, '权限修改', 300, null, 'sys:permission:update', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3002, '权限删除', 300, null, 'sys:permission:delete', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3003, '权限详情', 300, null, 'sys:permission:info', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3004, '权限分页列表', 300, null, 'sys:permission:page', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3005, '权限所有列表', 300, null, 'sys:permission:all:menu:list', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3006, '权限所有树形列表', 300, null, 'sys:permission:all:menu:tree', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3007, '权限用户列表', 300, null, 'sys:permission:menu:list', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3008, '权限用户树形列表', 300, null, 'sys:permission:menu:tree', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3009, '权限用户代码列表', 300, null, 'sys:permission:codes', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (4000, '部门新增', 400, null, 'sys:department:add', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (4001, '部门修改', 400, null, 'sys:department:update', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (4002, '部门删除', 400, null, 'sys:department:delete', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (4003, '部门详情', 400, null, 'sys:department:info', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_PERMISSION (ID, NAME, PARENT_ID, URL, CODE, ICON, TYPE, "LEVEL", STATE, SORT, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (4004, '部门分页列表', 400, null, 'sys:department:page', null, 2, 3, 1, 0, null, 0, TO_DATE('2019-10-26 11:18:40', 'YYYY-MM-DD HH24:MI:SS'), null);


INSERT INTO SYS_ROLE (ID, NAME, CODE, TYPE, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1, '管理员', 'admin', null, 1, null, 0, TO_DATE('2019-10-25 09:47:21', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE (ID, NAME, CODE, TYPE, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2, 'test', 'test', null, 1, null, 0, TO_DATE('2019-10-25 09:48:02', 'YYYY-MM-DD HH24:MI:SS'), null);


INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1, 1, 1, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2, 1, 100, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (3, 1, 200, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (4, 1, 300, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (5, 1, 400, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (6, 1, 1000, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (7, 1, 1001, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (8, 1, 1002, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (9, 1, 1003, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (10, 1, 1004, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (11, 1, 1005, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (12, 1, 1006, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (13, 1, 2000, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (14, 1, 2001, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (15, 1, 2002, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (16, 1, 2003, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (17, 1, 2004, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (18, 1, 3000, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (19, 1, 3001, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (20, 1, 3002, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (21, 1, 3003, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (22, 1, 3004, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (23, 1, 3005, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (24, 1, 3006, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (25, 1, 3007, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (26, 1, 3008, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (27, 1, 3009, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (28, 1, 4001, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (29, 1, 4002, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (30, 1, 4003, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (31, 1, 4004, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (100, 1, 1, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (101, 1, 100, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (102, 1, 1000, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (103, 1, 1001, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (104, 1, 1002, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (105, 1, 1003, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_ROLE_PERMISSION (ID, ROLE_ID, PERMISSION_ID, STATE, REMARK, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (106, 1, 1004, 1, null, 0, TO_DATE('2019-10-26 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), null);


INSERT INTO SYS_USER (ID, USERNAME, NICKNAME, PASSWORD, SALT, PHONE, GENDER, HEAD, REMARK, STATE, DEPARTMENT_ID, ROLE_ID, DELETED, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (1, 'admin', '管理员', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '1', 1, 'http://localhost:8888//resource/201910281559227.jpg', 'Administrator Account', 1, 1, 1, 0, 1, TO_DATE('2019-08-26 00:52:01', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO SYS_USER (ID, USERNAME, NICKNAME, PASSWORD, SALT, PHONE, GENDER, HEAD, REMARK, STATE, DEPARTMENT_ID, ROLE_ID, DELETED, VERSION, CREATE_TIME, UPDATE_TIME) VALUES (2, 'test', '测试人员', '34783fb724b259beb71a1279f7cd93bdcfd92a273d566f926419a37825c500df', '087c2e9857f35f1e243367f3b89b81c1', '2', 1, null, 'Tester Account', 1, 1, 2, 0, 0, TO_DATE('2019-10-05 14:04:27', 'YYYY-MM-DD HH24:MI:SS'), null);
