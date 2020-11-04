// JavaScript Document
$(document).ready(function() {
	//底部小人物
	$("#fixed_left").hide();//先隐藏
	//判断滚动条是否到底部
	 var winH = $(window).height(); //页面可视区域高度  
     $(window).scroll(function() {  
      	 var pageH = $(document.body).height(); //页面高度 
       	 var scrollH = $(window).scrollTop(); //滚动条高度  
      	 var differ = (pageH - winH - scrollH) //差值;  
		 if (differ < 0.1) { //0.1代表滚到条已经到底
		    $("#fixed_left").show(500);//显示
		 }else{
			 $("#fixed_left").hide(500);//隐藏 
		 }
		 //返回顶部的小火箭
		 if($(window).scrollTop() >= 200){
			$("#backtop").slideDown(300); // 开始显示
		} else{
			$("#backtop").slideUp(); // 开始隐藏
		}			

	});	
	
	//定时让小火箭喷火
	var num=0;
	setInterval(function(){
		if(num%2==0){
			$("#backtop a img").css("top","39px");
			$("#backtop a img").css({"height":"12px"});			
		}else{
			$("#backtop a img").css("top","37px");
			$("#backtop a img").css({"height":"18px"});		
		}
		num++;
	},100);
	
	var visualHight = $(window).height(); //页面可视区域高度 
	$("#backtop").css("top",visualHight-120);//默认小火箭位置
	$("#backtop").click(function(){
		$("html,body").animate({scrollTop:0}, 500);//返回顶部	
		var rocketHight=$(this).height();//小火箭高度
		$(this).animate({"top":"-100px"},500,function(){
			$("#backtop").hide(); // 开始隐藏
			$(this).animate({"top": visualHight-120},500);//让小火箭回到底部
		});		
		unbind("#backtop");
	});
	 //底部小人物
	$("#fixed_left").hover(function(){
		$(this).css("background-position","-162px 0px");
	},function(){
		$(this).css("background-position","0px 0px");
	});
	
	//---------------------在线客服开始------------------------------//
		//客服窗口垂直居中方法
		var _top=($(window).height()-$("#service").height())/2;
		$("#service").css({top:_top});
		//关闭
        $('#close_im').bind('click',function(){
            $('#main-im').css("height","0");
            $('#im_main').hide();
            $('#open_im').show();
        });
		//打开
        $('#open_im').bind('click',function(e){
            $('#main-im').css("height","272");
            $('#im_main').show();
            $(this).hide();
        });
		//微信
		$(".weixing-container").hover(function(){
			 $('.weixing-show').show();
		},function(){
			$('.weixing-show').hide();
		});
		// 音乐
		var music = document.getElementById("bgMusic");
		//默认关掉音乐
		music_close();
		//音乐开关		
		$("#audioBtn").click(function(){
	
			if(music.paused){
				music_open();
			}else{
				music_close();
			}
		});
		
		function music_open(){
			music.play();
			$("#audioBtn").removeClass("pause");
			$("#audioBtn").attr("title","关闭音乐");
		}
		function music_close(){
			music.pause();
			$("#audioBtn").addClass("pause");
			$("#audioBtn").attr("title","打开音乐");
		}
	//---------------------在线客服结束------------------------------//

});

 
