package com.swzl.dao;

import com.swzl.bean.*;

import java.util.List;
import java.util.Map;

public interface AdminDao {

    List<UserEntity> user_list(Map<String, Object> params);

    List<UserEntity> user_list1(Map<String, Object> params);

    UserEntity getUser(Map<String, Object> params);

    int saveUser(UserEntity userEntity);

    int delauser(UserEntity entity);

    int upinfo(UserEntity user);

    int uppasswrod(Map<String, Object> params1);

    List<BannerEntity> banner_list(Map<String, Object> params);

    List<BannerEntity> banner_list1(Map<String, Object> params);

    int addbanner(BannerEntity eNotice);

    int delabanner(BannerEntity entity);

    List<LostEntity> lost_list(Map<String, Object> params);

    List<LostEntity> lost_list1(Map<String, Object> params);

    int addlost(LostEntity eNotice);

    int delalost(LostEntity entity);

    List<Notice> gg_list(Map<String, Object> params);

    List<Notice> gg_list1(Map<String, Object> params);

    int addgg(Notice chengJi);

    int delagg(Notice entity);

    List<MessageEntity> msg_list(Map<String, Object> params);

    List<MessageEntity> msg_list1(Map<String, Object> params);

    int addmsg(MessageEntity entity);

    int delamsg(MessageEntity entity);

    int upswinfo(LostEntity user);
}
