// pages/login/login.js
const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userName: '',
    password: '',
  },
  // 获取输入账号 

  phoneInput: function(e) {

    this.setData({
      userName: e.detail.value
    })

  },
  // 获取输入密码 
  passwordInput: function(e) {
    this.setData({
      password: e.detail.value
    })
  },
  // 登录 
  login: function() {
    var that =this;
    if (this.data.userName.length == 0 || this.data.password.length == 0) {
      wx.showToast({
        title: '账号和密码不能为空',
        icon: 'none',
        duration: 2000
      })
    } else {
      var params = {
        userName: this.data.userName,
        password: this.data.password,
      }
      wx.request({
        url: app.globalData.baseUrl + '/swzl/user/login',
        method: 'POST',
        data: params,
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        success: function(res) {
          if (res.data.code == 0) {
            wx.setStorageSync("userId", res.data.user.id);
            wx.setStorageSync("userName", res.data.user.userName);
            wx.switchTab()
            wx.switchTab({
              url: "../index/index",
            })
          } else {
            wx.showToast({
              title: res.data.msg,
              icon: 'none',
            })
          }
        },
        fail(error) {
          reject(error)
        },
      })
    }
  },
  //立即注册
  goReg: function() {
    wx.navigateTo({
      url: '../regUser/index'
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  },
})