// JavaScript Document
$(document).ready(function() {
	//默认皮肤样式
	var skinno=1;
	
	//通过Cookie获取皮肤样式
	getSKinByCookie();
	
	//点击换肤
	var k=0;
	$(".changeSkin").click(function(){
		if(k==0){
			$(this).addClass("skin_open");
			$(this).text("收起");
			$("#myskin").slideDown();
			k++;
		}else{
			$(this).removeClass("skin_open");
			$(this).text("换肤");
			$("#myskin").slideUp();
			k=0;
		}
	});	

	$("#skin_close").click(function(){//关闭
		$(".changeSkin").removeClass("skin_open");
		$(".changeSkin").text("换肤");
		$("#myskin").slideUp();
		getSKinByCookie();
	});
	$("#skin_save").click(function(){//保存
		$(".changeSkin").removeClass("skin_open");
		$(".changeSkin").text("换肤");
		$("#myskin").slideUp();
		//把皮肤Id保存到Cookie中
		setCookie("skinno",skinno,7);
		getSKinByCookie();
	});
	//获取皮肤列表
	$lis=$("#skinbox ul li");
	//添加下标
	for(var i=0;i<$lis.length;i++){
		$lis[i].index=i;
	}
	$lis.click(function(){
		var no=this.index;//获取下标	
		skinno=no+1;
		changeSkin(skinno);//使用选中的皮肤
		$(this).children("span").addClass("select").end().siblings().children("span").removeClass("select");
		var bgpath="url(skin/images/skin"+skinno+".jpg) top center no-repeat";
		$("#previewPic").css({"background":bgpath,"background-size":"300px 196px"});
	})
	//导航样式
	$("#nav ul li").bind("click dblclick",function(){ //单击或双击导航菜单，实现移动动画
		$(this).addClass("current").siblings().removeClass("current");	
		if(!$("#logo,#search,#tag").is(":animated")){//加上这个判断，就算多次点击，也只执行一次动画
      		$("#logo").animate({"left":"-20px"},1000);
		    $("#logo").animate({"left":"0px"},1000);
			$("#search").animate({"top":"-5px"},500);
		    $("#search").animate({"top":"0px"},500);
		    $("#search").animate({"top":"5px"},500);
		    $("#search").animate({"top":"0px"},500);
		    $("#tag").animate({"left":"20px"},1000);
		    $("#tag").animate({"left":"0px"},1000);		   
		} 
		 unbind("#logo,#search,#tag");
	});
	
	
	
	//顶部会员昵称
	var noHide=false;//不隐藏
	$("#drop-down").hover(function(){		
		$("#userNav").slideDown();
	},function(){
		if(noHide==true){
			return;
		}
		setTimeout(function(){
			$("#userNav").hide();
		}, 2000);	 
	});

	$("#userNav").mouseover(function(){
		noHide=true;
		$(this).show();
		$("#nick").css("color","red");
	});
	
	$("#userNav").mouseout(function(){
		$(this).hide();
		$("#nick").css("color","#999");
	});
	
	//检测昵称长度，小于3就设置左内边距
	 var nick=$("#nick").html();
	 var regNick=/^\w{1,3}$/;//正则表达式
	 if(regNick.test(nick)==false){//不是1~3位的英文和字母
		 if(nick.length<=2){
			 $("#nick").css("padding-left","10px");
		 }
	 }else{
		    $("#nick").css("padding-left","10px");
	 }
	 

});

//打开会员中心
function openUserBox(id){
	//iframe层-禁滚动条
	layer.open({
	  type: 2,
	  title:'会员中心',
	  area: ['850px', '550px'],
	  skin: 'layui-layer-rim', //加上边框
	  content: ['user/index.jsp?tid='+id, 'no']
	}); 
}

//切换皮肤样式
function changeSkin(id){ 
var skin=document.getElementById("skin"); 
var path="skin/skin"+id+".css";
skin.setAttribute("href",path); 
} 

function getSKinByCookie(){
	//获取Cookie中保存的皮肤Id
    var skinId=getCookie("skinno");
	if(skinId!=null&&skinId!=""){
		changeSkin(skinId);
	}else{
		changeSkin(1);
	}
}
//设为首页
function SetHome(obj,url){
    try{
        obj.style.behavior='url(#default#homepage)';
       obj.setHomePage(url);
   }catch(e){
       if(window.netscape){
          try{
              netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
         }catch(e){
              alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
          }
       }else{
        alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
       }
  }
}
 
//收藏本站
function AddFavorite(title, url) {
  try {
      window.external.addFavorite(url, title);
  }
catch (e) {
     try {
       window.sidebar.addPanel(title, url, "");
    }
     catch (e) {
         alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
     }
  }
}
//设置cookie
function setCookie(name, value, exdays)
{
  var oDate=new Date();
  oDate.setDate(oDate.getDate()+exdays);
  document.cookie=name+'='+value+';expires='+oDate;
  /*方式二
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+d.toUTCString();
  document.cookie = name + "=" + value + "; " + expires;
  */
};
//读取cookies 
function getCookie(name)
{
  var arr=document.cookie.split('; '); //多个cookie值是以; 分隔的，用split把cookie分割开并赋值给数组
  for(var i=0;i<arr[i].length;i++) //历遍数组
  {
    var arr2=arr[i].split('='); //原来割好的数组是：user=simon，再用split('=')分割成：user simon 这样可以通过arr2[0] arr2[1]来分别获取user和simon 
    if(arr2[0]==name) //如果数组的属性名等于传进来的name
    {
      return arr2[1]; //就返回属性名对应的值
    }
    return ''; //没找到就返回空
  }
  /*方式二
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]); 
    else 
        return null;  
   */
}
//删除cookies 
function delCookie(name) 
{ 
	 setCookie(name, 1, -1); //-1就是告诉系统已经过期，系统就会立刻去删除cookie
	/*方式二
    var exp = new Date(); 
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name); 
    if(cval!=null) 
    document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    */ 
} 
