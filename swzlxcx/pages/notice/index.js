// pages/checkTop/checkTop.js
const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    name:'',
      dkList:[]
  },

  //点击确定确定
bindconfirm:function(){
    var that=this
    that.getListData();
  },

  listenerNewLabelInput:function(e){
    var that=this
    that.data.name = e.detail.value;
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getListData();
  },
  getListData:function(){
    var that = this;
    var params = {
      page:1,
      limit:'1000',
      name:that.data.name
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/api/gg_list',
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
  optListItemClick: function (event) {
    var userId = wx.getStorageSync('userId');
    if(!userId){
      wx.navigateTo({
        url: "../login/login",
      })
    }else{
    var that = this
    //拿到点击的index下标
    var data = event.currentTarget.dataset.item
    //将对象转为string
    var queryBean = JSON.stringify(data)
    wx.navigateTo({
      url: '../noticexq/index?queryBean=' + queryBean,
      })
  }
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