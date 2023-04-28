package com.swzl.service.impl;

import com.swzl.bean.*;
import com.swzl.dao.AdminDao;
import com.swzl.service.AdminService;
import com.swzl.utils.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminMapper;

    /*****************************用户管理*************************************/
    /**
     * 用户列表服务
     * @param params
     * @return
     */
    public Map<String,Object> user_list(Map<String,Object> params){
        Map<String,Object> ret = new HashMap<String,Object>();
        List<UserEntity> list = adminMapper.user_list(params);
        List<UserEntity> list1 = adminMapper.user_list1(params);
        ret.put("code", 0);
        ret.put("msg", "");
        ret.put("data", list);
        ret.put("count", list1.size());
        return ret;
    }

    public Map<String,Object> user_list1(Map<String,Object> params){
        Map<String,Object> ret = new HashMap<String,Object>();
        List<UserEntity> list1 = adminMapper.user_list1(params);
        ret.put("code", 0);
        ret.put("msg", "");
        ret.put("data", list1);
        return ret;
    }

    /**
     * 注册
     * @return
     */
    public Map<String,Object> adduser(UserEntity userEntity){
        Map<String,Object> ret = new HashMap<String,Object>();
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName", userEntity.getUserName());
        UserEntity u = adminMapper.getUser(params);
        if (u!=null) {
            ret.put("code", -1);
            ret.put("msg", "该用户已存在，请重新输入");
            return ret;
        }
        userEntity.setId(CommonUtil.id());
        userEntity.setPassword(CommonUtil.md5password(userEntity.getPassword()));
        int i = adminMapper.saveUser(userEntity);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        return ret;
    }

    /**
     * 删除用户服务
     * @param entity
     * @return
     */
    public Map<String,Object> delauser(UserEntity entity){
        Map<String,Object> ret = new HashMap<String,Object>();
        int i = adminMapper.delauser(entity);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "删除成功");
        return ret;
    }

    /**
     * 修改个人资料
     * @param user
     * @return
     */
    public Map<String,Object> upinfo(UserEntity user){
        Map<String,Object> ret = new HashMap<String,Object>();
        int i = adminMapper.upinfo(user);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "操作成功");
        return ret;
    }

    /**
     * 获取用户信息
     * @return
     */
    public Map<String,Object> getUserinfo(Map<String,Object> params){
        Map<String,Object> ret = new HashMap<String,Object>();
        UserEntity u = adminMapper.getUser(params);
        if (u == null) {
            ret.put("code", -1);
            ret.put("msg", "获取失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("user", u);
        return ret;
    }


    /**
     * 登录/获取用户信息
     * @param user
     * @return
     */
    public Map<String,Object> getUser(UserEntity user){
        Map<String,Object> ret = new HashMap<String,Object>();
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName", user.getUserName());
        params.put("password", user.getPassword());
        UserEntity u = adminMapper.getUser(params);
        if (u == null) {
            ret.put("code", -1);
            ret.put("msg", "用户名或密码不正确");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "登录成功");
        ret.put("user", u);
        return ret;
    }

    /** 修改密码
     * @return
     */
    public Map<String,Object> uppasswrod(String id,String password,String newpassword){
        Map<String,Object> ret = new HashMap<String,Object>();
        Map<String,Object> params = new HashMap<String,Object>();
        Map<String,Object> params1 = new HashMap<String,Object>();
        params.put("id", id);
        UserEntity u = adminMapper.getUser(params);
        String md5pas = CommonUtil.md5password(password);
        if (!u.getPassword().equals(md5pas)) {
            ret.put("code", -1);
            ret.put("msg", "原密码错误");
            return ret;
        }
        params1.put("id", id);
        params1.put("password", CommonUtil.md5password(newpassword));
        int i = adminMapper.uppasswrod(params1);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "修改失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "修改成功");
        return ret;
    }

    /*****************************公告管理*************************************/
    /**
     * 添加公告服务
     *
     * @return
     */
    @Override
    @SuppressWarnings("null")
    public Map<String, Object> addgg(Notice eNotice) {
        Map<String, Object> ret = new HashMap<String, Object>();
        eNotice.setId(CommonUtil.id());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        eNotice.setTime(df.format(new Date()));
        int i = adminMapper.addgg(eNotice);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("date", eNotice);
        return ret;
    }

    /**
     * 获取公告列表
     *
     * @param params
     * @return
     */
    @Override
    public Map<String, Object> gg_list(Map<String, Object> params) {
        Map<String, Object> ret = new HashMap<String, Object>();
        List<Notice> list = adminMapper.gg_list(params);
        List<Notice> list1 = adminMapper.gg_list1(params);
        ret.put("code", 0);
        ret.put("msg", "");
        ret.put("data", list);
        ret.put("count", list1.size());
        return ret;
    }

    /**
     * 删除公告服务
     *
     * @param entity
     * @return
     */
    @Override
    public Map<String, Object> delagg(Notice entity) {
        Map<String, Object> ret = new HashMap<String, Object>();
        int i = adminMapper.delagg(entity);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "删除成功");
        return ret;
    }



    /*****************************广告管理*************************************/
    /**
     * 广告列表
     * @param params
     * @return
     */
    public Map<String,Object> banner_list(Map<String,Object> params){
        Map<String,Object> ret = new HashMap<String,Object>();
        List<BannerEntity> list = adminMapper.banner_list(params);
        List<BannerEntity> list1 = adminMapper.banner_list1(params);
        ret.put("code", 0);
        ret.put("msg", "");
        ret.put("data", list);
        ret.put("count", list1.size());
        return ret;
    }

    /**
     * 添加广告服务
     * @return
     */
    @SuppressWarnings("null")
    public Map<String,Object> addbanner(BannerEntity eNotice){
        Map<String,Object> ret = new HashMap<String,Object>();
        eNotice.setId(CommonUtil.id());
        int i = adminMapper.addbanner(eNotice);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("date", eNotice);
        return ret;
    }

    /**
     * 删除广告服务
     * @param entity
     * @return
     */
    public Map<String,Object> delabanner(BannerEntity entity){
        Map<String,Object> ret = new HashMap<String,Object>();
        int i = adminMapper.delabanner(entity);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "删除成功");
        return ret;
    }

    /*****************************失物管理*************************************/
    /**
     * 失物列表
     * @param params
     * @return
     */
    public Map<String,Object> lost_list(Map<String,Object> params){
        Map<String,Object> ret = new HashMap<String,Object>();
        List<LostEntity> list = adminMapper.lost_list(params);
        List<LostEntity> list1 = adminMapper.lost_list1(params);
        for (int i=0;i<list.size();i++) {
            list.get(i).setTimes(getTimestamp(list.get(i).getTime()));
            String img = list.get(i).getPic();
            list.get(i).setImg(Arrays.asList(img.split(",")));;
            Map<String,Object> params1 = new HashMap<String,Object>();
            params1.put("id", list.get(i).getUserId());
            UserEntity u = adminMapper.getUser(params1);
            if (u!=null){
                list.get(i).setUser(u);
            }else {
                list.remove(i);
                list1.remove(i);
                i--;
            }
        }
        Collections.sort(list, new Comparator<LostEntity>() {
            // 按年龄从大到小排序
            @Override
            public int compare(LostEntity p1, LostEntity p2) {
                return p1.getTimes() == p2.getTimes() ? 0 : (p1.getTimes() < p2.getTimes() ? 1 : -1);
            }
        });
        ret.put("code", 0);
        ret.put("msg", "");
        ret.put("data", list);
        ret.put("count", list1.size());
        return ret;
    }

    /**
     * 添加失物服务
     * @return
     */
    @SuppressWarnings("null")
    public Map<String,Object> addlost(LostEntity eNotice){
        Map<String,Object> ret = new HashMap<String,Object>();
        eNotice.setId(CommonUtil.id());
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        eNotice.setTime(formatter.format(date));
        int i = adminMapper.addlost(eNotice);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("date", eNotice);
        return ret;
    }

    /**
     * 删除失物服务
     * @param entity
     * @return
     */
    public Map<String,Object> delalost(LostEntity entity){
        Map<String,Object> ret = new HashMap<String,Object>();
        int i = adminMapper.delalost(entity);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "删除成功");
        return ret;
    }

    @Override
    public Map<String, Object> upswinfo(LostEntity user) {
        Map<String,Object> ret = new HashMap<String,Object>();
        int i = adminMapper.upswinfo(user);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "操作成功");
        return ret;
    }


    /*****************************留言管理*************************************/
    @Override
    public Map<String, Object> addmsg(MessageEntity entity) {
        Map<String,Object> ret = new HashMap<String,Object>();
        entity.setId(CommonUtil.id());
        int i = adminMapper.addmsg(entity);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("data", entity);
        return ret;
    }

    @Override
    public Map<String, Object> msg_list(Map<String, Object> params) {
        Map<String,Object> ret = new HashMap<String,Object>();
        List<MessageEntity> list = adminMapper.msg_list(params);
        List<MessageEntity> list1 = adminMapper.msg_list1(params);
        for (int i = 0; i < list.size(); i++) {
            Map<String,Object> params1 = new HashMap<String,Object>();
            params1.put("id", list.get(i).getUserId());
            UserEntity u = adminMapper.getUser(params1);
            list.get(i).setUserName(u.getUserName());
        }
        ret.put("code", 0);
        ret.put("msg", "");
        ret.put("count", list1.size());
        ret.put("data", list);
        return ret;
    }

    @Override
    public Map<String, Object> delamsg(MessageEntity entity) {
        Map<String,Object> ret = new HashMap<String,Object>();
        int i = adminMapper.delamsg(entity);
        if (i == 0) {
            ret.put("code", -1);
            ret.put("msg", "操作失败");
            return ret;
        }
        ret.put("code", 0);
        ret.put("msg", "删除成功");
        return ret;
    }


    /**
     * @desc 字符串转时间戳
     **/
    public Long getTimestamp(String time) {
        Long timestamp = null;
        try {
            timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time).getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return timestamp;
    }
}
