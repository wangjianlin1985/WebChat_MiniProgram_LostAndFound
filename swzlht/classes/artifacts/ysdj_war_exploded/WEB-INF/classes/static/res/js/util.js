var iUtils = {
	reg_check : {
			//自然数，即0以及正整数
			zi_ran_shu : function(o){
				var reg = /^[1-9]\d*$|^0$/;
				return reg.test(o);
			},
			//正整数
			zheng_zheng_shu : function(o){
				var reg = /^[1-9]\d*$/;
				return reg.test(o);
			},
			//钱，即0以及正浮点数最多2位，可以为整数
			qian : function(o){
				var reg = /^[1-9]\d*\.[0-9]?[0-9]$|^0\.[0-9]?[0-9]$|^[1-9]\d*$|^0$/;
				return reg.test(o);
			},
			//钱，即0以及正浮点数最多2位，可以为整数，可以负数
			fu_qian : function(o){
				var reg = /^[1-9]\d*\.[0-9]?[0-9]$|^0\.[0-9]?[0-9]$|^[1-9]\d*$|^0$|^-[1-9]\d*\.[0-9]?[0-9]$|^-0\.[0-9]?[0-9]$|^-[1-9]\d*$/;
				return reg.test(o);
			}
	}
};

//全局设置，异步请求session超时处理
$.ajaxSetup({
    complete: function (XMLHttpRequest, textStatus) {
        var data = XMLHttpRequest.responseText;
        if (data == "timeout") {
        	window.top.location = '/gongzheng';
        }
    }
});