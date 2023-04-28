const app = getApp()
const appG = app.globalData;
Page({
  /**
   * 页面的初始数据
   */
  data: {
    isIOS: false,
    userName: '',
    password: '',
    name: '',
    age: '',
    phone: '',
    head:'',
    sex: '男',
    imgUrl:app.globalData.baseUrl+'/file',
    optlist: [
      { name: '个人资料', img:'/images/info.png', url:  '../userInfo/index'},
      { name: '修改密码', img:'/images/uppass.png', url: '../resetPass/index'},
      { name: '发布信息', img:'/images/addsw.png', url: '../addlost/index'},
      { name: '我的失物', img:'/images/swlist.png', url: '../mylost/index'},
      { name: '我的招领', img:'/images/swlist.png', url: '../mylost1/index'},
      { name: '关于我们', img:'/images/swlist.png', url: '../about/index'},
    ],
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

  imageClick:function(){
    var that = this;
    wx.chooseImage({  //从本地相册选择图片或使用相机拍照
      count: 1, // 默认9
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
      success: function (res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
        var tempFilePaths = res.tempFilePaths
        wx.uploadFile({
          url: app.globalData.baseUrl + '/swzl/file/upload',
          filePath: tempFilePaths[0],
          name: 'file',
          header: {
            'content-type': 'multipart/form-data'
          },
          formData: {
            method: 'POST'   //请求方式
          },
          success: function (res) {
            var queryBean = JSON.parse(res.data);
            var fileurl = queryBean.fileurl;
            that.setData({
              head: fileurl
            });
           
            var params = {
              id:wx.getStorageSync('userId'),
              userName:that.data.userName,
              name: that.data.name,
              head:that.data.head,
              age: that.data.age,
              phone: that.data.phone,
              sex: that.data.sex,
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
        })
      }
    })
  },

//事件处理函数
toOrder: function (event) {
  var data = event.currentTarget.dataset.item
  wx.navigateTo({
    url: '../order/index?state='+data.typeId
  })
},

  editorUserInfo:function(event){
   
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
    var userId = wx.getStorageSync('userId');
    if(!userId){
      wx.navigateTo({
        url: "../login/index",
      })
    }else{
      this.getUserInfo();
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
    var that = this;
    this.onLoad();
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
  /**
   * 功能点击
   */
  optListItemClick: function (event) {
    var pageurl = event.currentTarget.dataset.url
    if (pageurl != null && pageurl.length > 0) {
      if ("callPhone"==pageurl){
        wx.makePhoneCall({
          phoneNumber: '400-616-8880',
        })
        return
      }
      wx.navigateTo({
        url: pageurl,
      })
    } else {
      wx.showToast({
        title: '功能暂未开放!',
        icon: 'none'
      })
    }
  },
  exitAccount:function(event){
    wx.showModal({
      title: '提示',
      content: '点击确定将退应用',
      showCancel: true,
      success: function (res) {
        if (res.cancel) {
          //点击取消,默认隐藏弹框
        } else {
          //清理数据(全局用户数据)
          getApp().globalData.userInfo = null
          wx.removeStorageSync("userToken")
          wx.removeStorageSync("phone")
          wx.showToast({
            title: '退出成功!',
          })
          wx.reLaunch({
            url: '../login/login',
            success: function (res) { },
            fail: function (res) { },
            complete: function (res) { },
          })
        }
      }
    })
  }
})