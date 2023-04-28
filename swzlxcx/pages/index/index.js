// pages/checkTop/checkTop.js
const app = getApp()
const appG = app.globalData;
Page({

  /**
   * 页面的初始数据
   */
  data: {
      dkList:[],
      dkList1:[],
      imgurl: app.globalData.baseUrl+'/file',
      swiperCurrent: 0,
       // tab切换  
       currentTab: 0,
       name:'',
  },

  swichNav: function (e) {
    var that = this;
    if (this.data.currentTab === e.target.dataset.current) {
        return false;
    } else {
        that.setData({
            currentTab: e.target.dataset.current,
        })
        if(e.detail.current == 0){
          this.getListData1('招领');
        }else{
          this.getListData1('报失');
        }
      
    }
},

swiperChange1: function (e) {
    this.setData({
        currentTab: e.detail.current,
    })
    if(e.detail.current == 0){
      this.getListData1('招领');
    }else{
      this.getListData1('失物');
    }
},

bindconfirm:function(e){
  var that=this;
  that.data.name = e.detail.value;
  if(that.data.currentTab == 0){
    this.getListData1('招领');
  }else{
    this.getListData1('失物');
  }
},
  
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getListData();
    this.getListData1('招领');
  },
  getListData:function(){
    var that = this;
    var params = {
      page:1,
      limit:'1000',
    }
    wx.request({
      url: app.globalData.baseUrl + '/swzl/api/banner_list',
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

  getListData1:function(type){
    var that = this;
    var params = {
      page:1,
      limit:'1000',
      name:that.data.name,
      state:'0',
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
            dkList1: res.data.data
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
     //将对象转为string
     var queryBean = JSON.stringify(data)
     wx.navigateTo({
       url: '../lostxq/index?queryBean=' + queryBean,
     })
  }
  },

/**
   * 功能点击
   */
  optListItemClick1: function (event) {
    var userId = wx.getStorageSync('userId');
    if(!userId){
      wx.navigateTo({
        url: "../login/index",
      })
    }else{
    var that = this
    //拿到点击的index下标
    var data = event.currentTarget.dataset.item
     //将对象转为string
     var queryBean = JSON.stringify(data)
     wx.navigateTo({
       url: '../bannerxq/index?queryBean=' + queryBean,
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
    if(this.data.currentTab == 0){
      this.getListData1('招领');
    }else{
      this.getListData1('报失');
    }
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

  },

   //轮播图的切换事件
   swiperChange: function(e){
    //只要把切换后当前的index传给<swiper>组件的current属性即可
        this.setData({
          swiperCurrent: e.detail.current
        })
      },
      //点击指示点切换
      chuangEvent: function(e){
        this.setData({
          swiperCurrent: e.currentTarget.id
        })
      }
    
})