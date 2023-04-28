const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    dkList:[],
    imgurl: app.globalData.baseUrl+'/file',
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    this.getListData1('招领');
  },

  getListData1:function(type){
    var that = this;
    var params = {
      page:1,
      limit:'1000',
      userId:wx.getStorageSync('userId'),
      type:type
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/api/lost_list',
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
   * 功能点击
   */
  optListItemClick: function (event) {
    var userId = wx.getStorageSync('userId');
    if(!userId){
      wx.navigateTo({
        url: "../login/index",
      })
    }else{
    var that = this
    //拿到点击的index下标
    var data = event.currentTarget.dataset.item
    if(data.state.indexOf("0")>=0){
      wx.showModal({
        title: '提示',
        content: '是否已认领？',
        showCancel: true,
        confirmText: '是的',
        cancelText:'查看详情',
        success: function (res) {
          if (res.cancel) {
               //将对象转为string
            var queryBean = JSON.stringify(data)
            wx.navigateTo({
              url: '../lostxq/index?queryBean=' + queryBean,
            })
          } else {
            that.upswinfo(data.id)
          }
        }
      })
    }else{
      //将对象转为string
      var queryBean = JSON.stringify(data)
      wx.navigateTo({
        url: '../lostxq/index?queryBean=' + queryBean,
      })
    }
  }
  },


  upswinfo:function(id){
    var that = this;
    var params = {
      id:id,
      state:'1',
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/user/upswinfo',
      method: 'POST',
      data: params,
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        if (res.data.code == 0) {
          that.getListData1();
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