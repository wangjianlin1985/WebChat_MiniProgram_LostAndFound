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
    title:'',
    content:'',
    pic:'',
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this
    var queryBean = JSON.parse(options.queryBean);
    that.setData({
      title : queryBean.title,
      content : queryBean.content,
      pic : queryBean.pic,
      id:queryBean.id,
    })
  },
 

//点击事件  
clickImg1: function(e){
  var imgUrl = this.data.imgurl+this.data.pic;
  wx.previewImage({
    urls: [imgUrl], //需要预览的图片http链接列表，注意是数组
    current: '', // 当前显示图片的http链接，默认是第一个
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