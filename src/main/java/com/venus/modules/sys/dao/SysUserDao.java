package com.venus.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.venus.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 系统用户
 *
 * @author Tomxuetao
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUserEntity> {

	/**
	 * 查询用户的所有权限
	 * @param userId  用户ID
	 */
	List<String> queryAllPerms(Long userId);

	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long userId);

	/**
	 * 根据用户名，查询系统用户
	 */
	SysUserEntity queryByUserName(String username);

	/**
	 * 查询用户信息
	 */
	SysUserEntity queryByUserId(Long userId);

}
