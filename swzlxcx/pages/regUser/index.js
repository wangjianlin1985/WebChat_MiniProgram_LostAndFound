// pages/reg/reg.js
const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userName: '',
    password: '',
    name: '',
    age: '',
    phone: '',
    head:'',
    sex: '男',
    array: ['男', '女'],
  },

  bindPickerChange: function (e) {
    var indexs = e.detail.value;
    this.setData({
      index: indexs
    })
    if (indexs == 0) {
      this.setData({
        sex: '男'
      })
    } else if (indexs == 1) {
      this.setData({
        sex: '女'
      })
    } else {
      this.setData({
        sex: ''
      })
    }
  },

  // 获取输入账号 
  userNmaeInput: function (e) {
    this.setData({
      userName: e.detail.value
    })

  },
  // 获取输入密码 
  passwordInput: function (e) {
    this.setData({
      password: e.detail.value
    })
  },

    // 获取输入姓名
  realnameInput: function (e) {
    this.setData({
      name: e.detail.value
    })
  },

  // 获取输入年龄
  ageInput: function (e) {
    this.setData({
      age: e.detail.value
    })
  },

     // 获取输入手机号码
     phoneInput: function (e) {
      this.setData({
        phone: e.detail.value
      })
    },
    
     
  // 注册
  login: function () {
    if (this.data.userName.length == 0 || this.data.password.length == 0) {
      wx.showToast({
        title: '账号和密码不能为空',
        icon: 'none',
        duration: 2000
      })
      return;
    }
    if (this.data.name.length == 0 ) {
      wx.showToast({
        title: '姓名不能为空',
        icon: 'none',
        duration: 2000
      })  
      return;
    }
    if (this.data.age.length == 0 ) {
      wx.showToast({
        title: '年龄不能为空',
        icon: 'none',
        duration: 2000
      })
      return;
    }
    if (this.data.phone.length == 0 ) {
      wx.showToast({
        title: '手机号码不能为空',
        icon: 'none',
        duration: 2000
      })
      return;
    }
   
    var params = {
      userName: this.data.userName,
      password: this.data.password,
      name:this.data.name,
      sex:this.data.sex,
      age:this.data.age,
      phone:this.data.phone,
      head:this.data.head,
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/user/reg',
      method: 'POST',
      data: params,
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function(res) {
        if (res.data.code == 0) {
          wx.showToast({
            title:'注册成功',
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