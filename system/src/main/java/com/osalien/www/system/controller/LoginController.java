/*
 * Copyright 2019-2029 geekidea(https://github.com/geekidea)
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

package com.osalien.www.system.controller;

import com.alibaba.fastjson.JSON;
import com.osalien.www.system.param.LoginParam;
import com.osalien.www.framework.common.api.ApiResult;
import com.osalien.www.framework.log.annotation.Module;
import com.osalien.www.framework.log.annotation.OperationLogIgnore;
import com.osalien.www.framework.shiro.util.JwtTokenUtil;
import com.osalien.www.system.service.LoginService;
import com.osalien.www.system.service.SysUserService;
import com.osalien.www.system.vo.LoginSysUserTokenVo;
import com.osalien.www.system.vo.SysUserQueryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录控制器
 *
 * @author geekidea
 * @date 2019-09-28
 * @since 1.3.0.RELEASE
 **/
@Slf4j
@RestController
@Module("system")
@Api(value = "系统登录API", tags = {"系统登录"})
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private RedisTemplate redisTemplate;

    @PostMapping("/login")
    @OperationLogIgnore
    @ApiOperation(value = "登录", notes = "系统用户登录", response = LoginSysUserTokenVo.class)
    public ApiResult<LoginSysUserTokenVo> login(@Validated @RequestBody LoginParam loginParam, HttpServletResponse response) throws Exception {
        LoginSysUserTokenVo loginSysUserTokenVo = loginService.login(loginParam);
        // 设置token响应头
        response.setHeader(JwtTokenUtil.getTokenName(), loginSysUserTokenVo.getToken());
        return ApiResult.ok(loginSysUserTokenVo, "登录成功");
    }


    /**
     * 根据token获取系统登录用户信息
     *
     * @return
     */
    @GetMapping("/getSysUserInfo")
    @ApiOperation(value = "根据token获取系统登录用户信息", response = SysUserQueryVo.class)
    public ApiResult<JSON> getSysUser() throws Exception {
//        String token =  JwtTokenUtil.getToken();
//        String tokenSha256 = DigestUtils.sha256Hex(token);
//        LoginSysUserVo loginSysUserVo = (LoginSysUserVo) redisTemplate.opsForValue().get(tokenSha256);
//        return ApiResult.ok(loginSysUserVo);

        String json = "{\n" +
                "    roles: ['admin'],\n" +
                "    introduction: 'I am a super administrator',\n" +
                "    avatar: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',\n" +
                "    name: 'Super Admin'\n" +
                "  }";
        JSON array = JSON.parseObject(json);

        return ApiResult.ok(array);
    }

    @PostMapping("/logout")
    @OperationLogIgnore
    public ApiResult<String> logout(HttpServletRequest request) throws Exception {
        loginService.logout(request);
        return ApiResult.ok("退出成功");
    }

}
