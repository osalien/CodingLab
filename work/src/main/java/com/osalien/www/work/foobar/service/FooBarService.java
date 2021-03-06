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

package com.osalien.www.work.foobar.service;

import com.osalien.www.work.foobar.entity.FooBar;
import com.osalien.www.work.foobar.param.FooBarPageParam;
import com.osalien.www.framework.common.service.BaseService;
import com.osalien.www.framework.core.pagination.Paging;

/**
 * FooBar 服务类
 *
 * @author osalien
 * @since 2020-03-24
 */
public interface FooBarService extends BaseService<FooBar> {

    /**
     * 保存
     *
     * @param fooBar
     * @return
     * @throws Exception
     */
    boolean saveFooBar(FooBar fooBar) throws Exception;

    /**
     * 修改
     *
     * @param fooBar
     * @return
     * @throws Exception
     */
    boolean updateFooBar(FooBar fooBar) throws Exception;

    /**
     * 删除
     *
     * @param id
     * @return
     * @throws Exception
     */
    boolean deleteFooBar(Long id) throws Exception;


    /**
     * 获取分页对象
     *
     * @param fooBarQueryParam
     * @return
     * @throws Exception
     */
    Paging<FooBar> getFooBarPageList(FooBarPageParam fooBarPageParam) throws Exception;

}
