package com.swzl.service;

import com.swzl.bean.*;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface AdminService {

	Map<String, Object> user_list(Map<String, Object> params);

	Map<String, Object> user_list1(Map<String, Object> params);

	Map<String, Object> delauser(UserEntity entity);

	Map<String, Object> uppasswrod(String id, String password, String newpassword);

	Map<String, Object> getUser(UserEntity user);

	Map<String, Object> getUserinfo(Map<String, Object> params);

	Map<String, Object> upinfo(UserEntity user);

	Map<String, Object> adduser(UserEntity entity);

	Map<String, Object> addbanner(BannerEntity fkBean);

	Map<String, Object> banner_list(Map<String, Object> params);

	Map<String, Object> delabanner(BannerEntity entity);

	Map<String, Object> addlost(LostEntity fkBean);

	Map<String, Object> lost_list(Map<String, Object> params);

	Map<String, Object> delalost(LostEntity entity);

	Map<String,Object> addgg(Notice eNotice)throws RuntimeException;

	Map<String,Object> gg_list(Map<String,Object> params)throws RuntimeException;

	Map<String,Object> delagg(Notice entity)throws RuntimeException;

    Map<String, Object> addmsg(MessageEntity entity);

	Map<String, Object> msg_list(Map<String, Object> params);

	Map<String, Object> delamsg(MessageEntity entity);

    Map<String, Object> upswinfo(LostEntity user);
}
