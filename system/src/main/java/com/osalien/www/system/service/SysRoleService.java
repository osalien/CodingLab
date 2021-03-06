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

package com.osalien.www.system.service;

import com.osalien.www.framework.common.service.BaseService;
import com.osalien.www.framework.core.pagination.Paging;
import com.osalien.www.system.entity.SysRole;
import com.osalien.www.system.param.sysrole.SysRolePageParam;
import com.osalien.www.system.param.sysrole.UpdateSysRolePermissionParam;
import com.osalien.www.system.vo.SysRoleQueryVo;

import java.io.Serializable;

/**
 * <pre>
 * 系统角色 服务类
 * </pre>
 *
 * @author osalien
 * @since 2019-10-24
 */
public interface SysRoleService extends BaseService<SysRole> {

    /**
     * 保存
     *
     * @param addSysRoleParam
     * @return
     * @throws Exception
     */
    boolean saveSysRole(SysRole sysRole) throws Exception;

    /**
     * 修改
     *
     * @param updateSysRoleParam
     * @return
     * @throws Exception
     */
    boolean updateSysRole(SysRole sysRole) throws Exception;

    /**
     * 删除
     *
     * @param id
     * @return
     * @throws Exception
     */
    boolean deleteSysRole(Long id) throws Exception;

    /**
     * 根据ID获取查询对象
     *
     * @param id
     * @return
     * @throws Exception
     */
    SysRoleQueryVo getSysRoleById(Serializable id) throws Exception;

    /**
     * 获取分页对象
     *
     * @param sysRolePageParam
     * @return
     * @throws Exception
     */
    Paging<SysRole> getSysRolePageList(SysRolePageParam sysRolePageParam) throws Exception;

    /**
     * 根据id校验角色是否存在并且已启用
     *
     * @param id
     * @return
     * @throws Exception
     */
    boolean isEnableSysRole(Long id) throws Exception;

    /**
     * 判断角色编码是否存在
     *
     * @param code
     * @return
     * @throws Exception
     */
    boolean isExistsByCode(String code) throws Exception;

    /**
     * 修改系统角色权限配置
     *
     * @param param
     * @return
     * @throws Exception
     */
    boolean updateSysRolePermission(UpdateSysRolePermissionParam param) throws Exception;
}
