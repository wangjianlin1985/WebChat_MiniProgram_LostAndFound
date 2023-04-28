// pages/checkTop/checkTop.js
const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    imgurl: app.globalData.baseUrl+'/file',
    id: '',
    name:'',
    content:'',
    type:'',
    time:'',
    phone:'',
    contacts:'',
    address:'',
    pic:'',
    img:[],
  },

   // 获取输入内容
   nameInput: function (e) {
    this.setData({
      content: e.detail.value
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this
    var queryBean = JSON.parse(options.queryBean);
    that.setData({
      name : queryBean.name,
      content : queryBean.content,
      pic : queryBean.pic,
      type : queryBean.type,
      time : queryBean.time,
      phone : queryBean.phone,
      contacts : queryBean.contacts,
      address : queryBean.address,
      img : queryBean.img,
      id:queryBean.id,
    })
    that.getListData();
  },

  getListData:function(){
    var that = this;
    var params = {
      page:1,
      limit:'1000',
      lostId:that.data.id,
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/user/msg_list',
      method: 'POST',
      data: params,
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      
      success: function (res) {
        if (res.data.code == 0) {
          that.setData({
            dkList: res.data.data
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

 /**
   * 功能点击
   */
  optListItemClick: function () {
    var userId = wx.getStorageSync('userId');
    var that=this
    var id = that.data.plId;
    var params = {
      userId:userId,
      lostId:this.data.id,
      content: this.data.content,
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/user/addmsg',
      method: 'POST',
      data: params,
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        if (res.data.code == 0) {
          wx.showToast({
            title: '留言成功',
            icon: 'none',
          })
          that.getListData();
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



  call:function(){
    var that = this;
    wx.showModal({
      title: '提示',
      content: '确定联系'+that.data.phone,
      showCancel: true,
      success: function (res) {
        if (res.cancel) {
          //点击取消,默认隐藏弹框
        } else {
          wx.makePhoneCall({
            phoneNumber: that.data.phone,
          })
        }
      }
    })
  },
 

// 点击图片进行大图查看
LookPhoto: function(e) {
  var imgUrl = e.currentTarget.dataset.photurl;
  wx.previewImage({
    urls: [imgUrl], //需要预览的图片http链接列表，注意是数组
    current: imgUrl, // 当前显示图片的http链接，默认是第一个
    success: function (res) { },
    fail: function (res) { },
    complete: function (res) { },
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