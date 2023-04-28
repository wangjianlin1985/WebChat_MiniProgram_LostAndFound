//app.js
App({
  onLaunch: function () {

  },
  globalData: {
    userInfo: null,
    baseUrl: "http://localhost:8081",
    /**
         * 封装post
         * @param {*} res 
         */
    post: function (res) {
      var _this = this;
      // console.log('传递的数据--',res);
      var newR = {
        method: "POST",
        header: {
          'Content-Type': "application/json"
        }
      };
      newR = Object.assign(newR, res);
      //检查地址
      if (newR.url.indexOf(_this.baseUrl) == -1) {
        newR.url = _this.baseUrl + newR.url
      }
      newR.success = function (_res) {
        //打印通讯数据
        console.log("appPost", {
          postData: _res,
          postUrl: newR.url,
          postData: newR.data
        })
        if (_res.data.code == 401) {
          //token过期，去重新登录
          var pages = getCurrentPages();
          var curPages = pages[pages.length - 1].route;
          if (curPages == "pages/login/index") {
            return;
          } else {
            _this.navigateTo({
              url: '/pages/login/index',
              getData: _res.data
            })
          }
        } else {
          if (res.success) {
            res.success(_res);
          }
        }
      }
      wx.request(newR)
    },
    /**
     * 封装跳转方法（含防止跳死机制）
     * @param {*} res Object 同微信小程序
     */
    navigateTo: function (res) {
      var _this = this;
      this.navN++;
      //获取页面栈数据
      var yez = getCurrentPages();
      console.log("页面栈", {
        url: res.url,
        data: res,
        pages: yez,
        num: _this.navN,
        time: new Date()
      })//res.url, getCurrentPages(), this.navN

      //不进入同一页面
      if (res.url.indexOf(yez[yez.length - 1].route) == -1) {
        if (res.type == 1) {
          //点击底部的导航时清除所有的栈，防止栈溢出导致跳转失灵
          wx.reLaunch(res);
          //wx.redirectTo(res);
        } else {
          //tabBar 跳转------------------------------------------------------------------
          wx.switchTab({
            ...res,
            fail: (swiErr) => {
              console.log("navigateTo_switchTab_err", swiErr, res);
              if (res.fail) {
                //res.fail(_res);
              }
              //保留当前页面，跳转---------------------------------------------------
              wx.navigateTo({
                ...res,
                fail: (navErr) => {
                  console.log("navigateTo_navigateTo_err", navErr);
                  //关闭当前页面，跳转(一般用于10次层级跳转失败)---------------------------------------------
                  wx.redirectTo({
                    ...res,
                    fail: (redErr) => {
                      console.log("navigateTo_redirectTo_err", redErr);
                      if (res.fail) {
                        res.fail(redErr);
                      }
                    }
                  })
                }
              });
            }
          });
        }
      } else {
        //只刷新当前数据
        yez[yez.length - 1].onLoad(yez[yez.length - 1].options);
      }
    },
    /**
         * 获取点击事件传参
         * @param {*} res Object bindTap res
         * @param {*} key String 需要获取的key
         */
    getTapData: function (res, key) {
      var tD = res.currentTarget.dataset[key];
      console.log("点击事件传参", res.currentTarget, tD)
      if (tD || tD == 0) {
        return tD;
      } else {
        return res.currentTarget.dataset;
      }
    },
  }
})