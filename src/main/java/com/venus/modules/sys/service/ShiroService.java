

package com.venus.modules.sys.service;

import com.venus.modules.sys.entity.SysUserEntity;
import com.venus.modules.sys.entity.SysUserTokenEntity;

import java.util.Set;

/**
 * shiro相关接口
 *
 * @author Tomxuetao
 */
public interface ShiroService {
    /**
     * 获取用户权限列表
     */
    Set getUserPermissions(long userId);

    SysUserTokenEntity queryByToken(String token);

    /**
     * 根据用户ID，查询用户
     * @param userId
     */
    SysUserEntity queryUser(Long userId);
}
