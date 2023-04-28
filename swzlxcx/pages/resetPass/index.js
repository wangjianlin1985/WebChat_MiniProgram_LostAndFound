// pages/forgetPwd/forgetPwd.js
const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    password: '',
    newPass: ''
  },
  // 获取输入密码 
  passwordInput: function (e) {
    this.setData({
      password: e.detail.value
    })
  },
  // 获取输入新密码 
  newPasswordInput: function (e) {
    this.setData({
      newPass: e.detail.value
    })
  },
  // 提交修改密码
  login: function () {
    if (this.data.password.length == 0 || this.data.newPass.length === 0) {
      wx.showToast({
        title: '账号和密码不能为空',
        icon: 'none',
        duration: 2000
      })
    } else {
      var userId = wx.getStorageSync('userId');
      var params = {
        id:userId,
        password: this.data.password,
        newpassword: this.data.newPass
      }
      wx.request({
        url: app.globalData.baseUrl + '/swzl/user/uppwd',
        method: 'POST',
        data: params,
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        success: function (res) {
          if (res.data.code == 0) {
            wx.showToast({
              title: '修改成功',
              icon: 'none',
            })
            setTimeout(function () {
              wx.navigateBack({
                delta: 2,
              });
            }, 1000)
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
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})