// pages/userInfo/userInfo.js
const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userName:'',
    name: '',
    age: '',
    phone: '',
    head:'',
    sex: '',
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

  // 获取输入姓名
  nikNameInput: function (e) {
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

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
      this.getUserInfo();
  },
  //获取个人信息资料
  getUserInfo:function(){
    var that = this;
    var userId = wx.getStorageSync('userId');
    var params = {
      id: userId,
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/user/getUserinfo',
      method: 'POST',
      data: params,
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        if (res.data.code == 0) {
          that.setData({
            userName:res.data.user.userName,
            name: res.data.user.name,
            head:res.data.user.head,
            age: res.data.user.age,
            phone: res.data.user.phone,
            sex: res.data.user.sex,
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
  },
  
  // 修改资料
  logins: function () {
    var params = {
      id:wx.getStorageSync('userId'),
      userName:this.data.userName,
      name: this.data.name,
      head:this.data.head,
      age: this.data.age,
      phone: this.data.phone,
      sex: this.data.sex,
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/user/upinfo',
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