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

package com.osalien.www.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.osalien.www.system.entity.SysDepartment;
import com.osalien.www.system.param.SysDepartmentPageParam;
import com.osalien.www.system.vo.SysDepartmentQueryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

/**
 * <pre>
 * 部门 Mapper 接口
 * </pre>
 *
 * @author osalien
 * @since 2019-10-24
 */
@Repository
public interface SysDepartmentMapper extends BaseMapper<SysDepartment> {

    /**
     * 根据ID获取查询对象
     *
     * @param id
     * @return
     */
    SysDepartmentQueryVo getSysDepartmentById(Serializable id);

    /**
     * 获取分页对象
     *
     * @param page
     * @param sysDepartmentPageParam
     * @return
     */
    IPage<SysDepartmentQueryVo> getSysDepartmentPageList(@Param("page") Page page, @Param("param") SysDepartmentPageParam sysDepartmentPageParam);

}
