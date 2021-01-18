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

package com.osalien.www.work.foobar.controller;

import com.osalien.www.work.foobar.entity.FooBar;
import com.osalien.www.work.foobar.param.FooBarPageParam;
import com.osalien.www.work.foobar.service.FooBarService;
import com.osalien.www.framework.common.api.ApiResult;
import com.osalien.www.framework.common.controller.BaseController;
import com.osalien.www.framework.core.pagination.Paging;
import com.osalien.www.framework.core.validator.groups.Add;
import com.osalien.www.framework.core.validator.groups.Update;
import com.osalien.www.framework.log.annotation.Module;
import com.osalien.www.framework.log.annotation.OperationLog;
import com.osalien.www.framework.log.enums.OperationLogType;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * FooBar 控制器
 *
 * @author osalien
 * @since 2020-03-24
 */
@Slf4j
@RestController
@RequestMapping("/fooBar")
@Module("foobar")
@Api(value = "FooBarAPI", tags = {"FooBar"})
public class FooBarController extends BaseController {

    @Autowired
    private FooBarService fooBarService;

    /**
     * 添加FooBar
     */
    @PostMapping("/add")
    @OperationLog(name = "添加FooBar", type = OperationLogType.ADD)
    @ApiOperation(value = "添加FooBar", response = ApiResult.class)
    public ApiResult<Boolean> addFooBar(@Validated(Add.class) @RequestBody FooBar fooBar) throws Exception {
        boolean flag = fooBarService.saveFooBar(fooBar);
        return ApiResult.result(flag);
    }

    /**
     * 修改FooBar
     */
    @PostMapping("/update")
    @OperationLog(name = "修改FooBar", type = OperationLogType.UPDATE)
    @ApiOperation(value = "修改FooBar", response = ApiResult.class)
    public ApiResult<Boolean> updateFooBar(@Validated(Update.class) @RequestBody FooBar fooBar) throws Exception {
        boolean flag = fooBarService.updateFooBar(fooBar);
        return ApiResult.result(flag);
    }

    /**
     * 删除FooBar
     */
    @PostMapping("/delete/{id}")
    @OperationLog(name = "删除FooBar", type = OperationLogType.DELETE)
    @ApiOperation(value = "删除FooBar", response = ApiResult.class)
    public ApiResult<Boolean> deleteFooBar(@PathVariable("id") Long id) throws Exception {
        boolean flag = fooBarService.deleteFooBar(id);
        return ApiResult.result(flag);
    }

    /**
     * 获取FooBar详情
     */
    @GetMapping("/info/{id}")
    @OperationLog(name = "FooBar详情", type = OperationLogType.INFO)
    @ApiOperation(value = "FooBar详情", response = FooBar.class)
    public ApiResult<FooBar> getFooBar(@PathVariable("id") Long id) throws Exception {
        FooBar fooBar = fooBarService.getById(id);
        return ApiResult.ok(fooBar);
    }

    /**
     * FooBar分页列表
     */
    @PostMapping("/getPageList")
    @OperationLog(name = "FooBar分页列表", type = OperationLogType.PAGE)
    @ApiOperation(value = "FooBar分页列表", response = FooBar.class)
    public ApiResult<Paging<FooBar>> getFooBarPageList(@Validated @RequestBody FooBarPageParam fooBarPageParam) throws Exception {
        Paging<FooBar> paging = fooBarService.getFooBarPageList(fooBarPageParam);
        return ApiResult.ok(paging);
    }

}

