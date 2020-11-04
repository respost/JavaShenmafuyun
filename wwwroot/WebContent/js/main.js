// JavaScript Document

$(document).ready(function() {
	//显示时间和问候语
	showDate();
	//登录窗口
	$("#login ul li div").eq(0).show();//默认显示第一个
	$("#login ul li").hover(function(){
		$(this).children("h5").addClass("h5_current").removeClass("h5_default");
		$(this).siblings().children("h5").addClass("h5_default").removeClass("h5_current");
		$(this).children("div").show();
		$(this).siblings().children("div").hide();
	});
	//最近更新：循环垂直向上滚动
	function movedome(){
	var margintop=0;//上边距的偏移量
	var stop=false;
	setInterval(function(){
	if(stop==true){
	return;
	}
	$("#newupdate").find("li").first().animate({"margin-top":margintop--},0,function(){
	var $li=$(this);
	if(!$li.is(":animated")){//第一个li的动画结束时
	if(-margintop>$li.height()){
	$li.css("margin-top","0px").appendTo($("#newupdate ul"));
	margintop=0;
	}
	}
	});
	},50);
	//鼠标放到最近更新(ul)上时
	$("#newupdate ul").hover(function(){
	$(this).css("cursor","pointer");
	stop=true;//停止动画
	},function(){
	stop=false;//开始动画
	});
	}
	movedome();	
	//设置排行榜样式
	$("#ranking ul li div").eq(0).show();//默认显示第一个
	$("#ranking ul li").hover(function(){
		$(this).children("h6").addClass("h6_current").removeClass("h6_default");
		$(this).siblings().children("h6").addClass("h6_default").removeClass("h6_current");
		$(this).children("div").show();
		$(this).siblings().children("div").hide();
	});
	
});

//显示时间和问候语的方法
function showDate(){
	//获取当前系统时间
	var date=new Date();
	//年
	var year=date.getFullYear();
	//月
	var month=date.getMonth()+1;
	//日
	var day=date.getDate();
	//时
	var hour=date.getHours();
	//分
	var minute=date.getMinutes();
	//秒
	var second=date.getSeconds();
	//星期
	var week=date.getDay();
	//凌晨,上午,下午,晚上
	var ap="别熬夜太晚哦！";
	if(hour>=6&&hour<12){
		ap="美好的一天开始了！";
	}else if(hour>=12&&hour<=13){
		ap="中午记得吃饭哟！";
	}else if(hour>13&&hour<18){
		ap="下午好！";
	}else if(hour>=18&&hour<24){
		ap="晚上好！";
	}
	$("#ap").html(ap);
}