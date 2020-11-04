<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.smfy.entity.User"%>
<%@ include file="../user_data.jsp" %>
<%@ include file="../checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<link rel="stylesheet"  href="css/tab.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<link rel="stylesheet" type="text/css" href="css/bgbox.css"/>
<link rel="stylesheet" type="text/css" href="../layer/theme/default/layer.css">
</head>
<body>
        <div id="tab" style="margin:0 auto;">
            <div class="tabContainer">
                <ul class="tabHead">
                    <li class="currentBtn"><a href="javascript:;" onclick="gotoInfo();">我的资料</a></li>
                    <li><a href="javascript:;" onclick="gotoPay();">账户充值</a></li>
                    <li><a href="javascript:;">升级会员</a></li>
                    <li><a href="javascript:;">修改密码</a></li>
					<li><a href="javascript:;">已购资源</a></li>
					<li><a href="javascript:;">佣金提现</a></li>
                    <li><a href="javascript:;">浏览记录</a></li>
                </ul>
            </div>
            <div class="tabBody">
                <ul>
               	    <!--基本资料-->
                    <li class="tabCot">                           
					<div id="infoBox">
						<div id="homeIco"></div>
						<div id="userInfo">
                        	<h5>
                            <a href="javascript:void(0)" onclick="uploaPic()" title="修改头像"><img class="headPic"  src="<%=headPic%>" /></a>
                            <span class="userNick">
                            <span id="userNick"><%=userNick%></span>
                            <img class="vipIco" src="<%=vipIco%>" />
                            </span>
                            <a class="upvip" href="javascript:void(0)" onclick="changeTab(2)">升级为会员</a>
                            </h5> 
							<p class="userName">用户名：<span  id="userName"><%=userName %></span></p>
							<p class="userMoney">余　额：<span id="userMoney"><%=userMoney %></span>&nbsp;<span class="moneyText">人民币(RMB)</span>&nbsp;
                            <span class="availText">佣金：</span><span id="userAvail"><%=userAvail%></span><span class="moneyText">(可提现)</span>
                             <a class="tikuan" href="javascript:void(0)" onclick="changeTab(5)">申请提现</a>
                            </p>							
						</div>
                        <div style="clear:both"></div>
                        <div class="infoLeft">
                       		<p>真实姓名：<%=realName%></p>
       						<p>会员积分：<%=points%></P>
                            <p>收款银行：<%=bankName%></P>
                            <p>银行卡号：<%=bankCard%></P>
                            <p>支行地址：<%=bankAddress%></P>
                            
                        </div>
                        <div class="inforight">
                       		<p>手机号码：<%=phone %></P>
                       		 <p>QQ号码： <%=qq %></P>
                            <p>电子邮箱：<%=email%></P>
                            <p>注册日期：<%=regDate %></P>
                            <p>最近登录：<%=loginDate %></P>
                           
                        </div>
					</div>
                    <!-- 修改会员头像 -->
                    <div id="headBox" style="display: none;" >
                    <iframe src="uploadPic/index.jsp"  width="100%" height="450" scrolling="no" frameborder="0"></iframe>
                    </div>
                    </li>
                     <!--账户充值-->
                    <li class="tabCot">
					<div id="payBox">
                    <iframe src="money.html" id="payIframe" width="100%" height="100%" scrolling="no" frameborder="0"></iframe>
					</div>
					
                    </li>
					 <!--升级会员-->
                    <li class="tabCot">
                    <div id="bgbox">
                        <form class="vipForm" action="javascript:void(0)" method="post">
						<p>我的会员状态：普通会员</p>   
                        <p>选择会员类型：</p>                   
                        <dl>
      					 <dd><img src="../images/vip/vipico.png"/><input type="radio"  name="vipType"/>包月会员：￥30元</dd>
                 		 <dd><img src="../images/vip/vipico.png"/><input type="radio"  name="vipType"/>包季会员：￥100元</dd>
                 		 <dd><img src="../images/vip/vipico.png"/><input type="radio"  name="vipType"/>包年会员：￥200元</dd>
                 		 <dd><img src="../images/vip/vipico.png"/><input type="radio"  name="vipType"/>永久会员：￥1000元</dd>
                        </dl>
                         <p style="text-align:center; margin-top:20px;"><input type="button" class="vpiBtn" value="立即升级"/></p>
                        </form>
                       
					</div>
                    </li>
					<!--修改密码-->
                    <li class="tabCot">
                    <div id="bgbox">
                        <div class="formBox" >
                            <form  action="javascript:void(0)" method="post" >
                            <dl>
                            <dt>原密码：</dt>
                            <dd><input id="oldPwd" type="text" placeholder="请输入原密码" /></dd>           
                            </dl>
                            <dl>
                            <dt>新密码：</dt>
                            <dd><input id="newPwd"  type="password" placeholder="请输入新密码" /></dd>
                            </dl>
                            <dl>
                            <dt>确认密码：</dt>
                             <dd><input id="rePwd" type="password" placeholder="请再次确认密码" /></dd>
                            </dl>
                            <dl class="btn">
                            <dt>&nbsp;</dt>
                            <dd><input type="submit" onclick="updatePwd()" value="确认修改"/></dd>
                            </dl>
                            </form>
                        </div> 
					</div>
                    </li>
					<!--已购资源-->
                    <li class="tabCot">
                    <div id="bgbox">
						<iframe src="purchase.html" width="100%" height="100%" scrolling="no" frameborder="0"></iframe>
					</div>
                    </li>
					<!--佣金提现-->
                    <li class="tabCot">
                     <div id="bgbox">               	
						 <div id="tikuan" class="formBox">
                         <h3>提现须知：请先绑定银行卡，然后才可以申请提现。<a href="javascript:void(0)" onclick="gotoBank()">点击绑定银行卡</a></h3>
                            <form  action="javascript:void(0)" method="post" >
                            <dl>
                            <dt>全部佣金：</dt>
                            <dd>100元<a href="javascript:void(0)"; id="whatIsAvail" onmouseover="availDisc()">什么是佣金？</a></span></dd>           
                            </dl>
                            <dl>
                            <dl>
                            <dt>提现金额：</dt>
                            <dd><input id="avail" type="text" placeholder="请输入想提现的金额" /></dd>           
                            </dl>
                            <dl class="btn">
                            <dt>&nbsp;</dt>
                            <dd><input style="background:#F93" onclick="getAvail()" type="submit" value="申请提现"/></dd>
                            </dl>
                            </form>
                        </div> 
                         <div class="bankBox" >
                         <h3>绑定银行卡信息：<a href="javascript:void(0)" onclick="backAvail()">（点击返回）</a></h3>
                            <form  action="javascript:void(0)" method="post" >
                            <dl>
                            <dt>收款银行：</dt>
                           	<dd><input id="bankName" type="text" placeholder="请输入银行名称" /></dd>          
                            </dl>
                            <dl>
                            <dt>开户姓名：</dt>
                           	<dd><input id="realName" type="text" placeholder="请输入持卡人姓名" /></dd>          
                            </dl>
                            <dl>
                            <dl>
                            <dt>银行卡号：</dt>
                            <dd><input id="bankCard" type="text" placeholder="请输入银行卡号" /></dd>           
                            </dl>
                            <dl>
                            <dt>支行地址：</dt>
                            <dd><input id="bankAddress" type="text" placeholder="请输入开户行所在地址" /></dd>           
                            </dl>
                            <dl class="btn">
                            <dt>&nbsp;</dt>
                            <dd><input type="submit" onclick="bindBank()" value="点击绑定"/></dd>
                            </dl>
                            </form>
                        </div> 
					</div>
                    </li>
					<!--浏览记录-->
                    <li class="tabCot">
					<div id="bgbox">
                        <iframe src="record.html" width="100%" height="100%" scrolling="no" frameborder="0"></iframe>
					</div>
                    </li>
                </ul>
                <div style="clear:both"></div>
            </div>
            <div class="modBottom">
                <span class="modABL">&nbsp;</span><span class="modABR">&nbsp;</span>
            </div>
        </div>
		<script type="text/javascript" src="../jquery/jquery-1.8.3.min.js"></script> 
        <script type='text/javascript' src='js/tab.js'></script>
        <script type="text/javascript" src="../layer/layer.js"></script>
        <script language="javascript" type="text/javascript">
            $(function() {
				var tabId=GetQueryString("tid");//要打开第几个tab,默认0为第一个
				if(tabId==null||tabId==""){
					tabId=0;
				}							
               changeTab(tabId);
            });
            //修改头像
            function uploaPic(){
            	$("#infoBox").hide();
            	$("#headBox").show();
            }
            //修改密码
            function updatePwd(){
            	var id='${user.id}';
            	var userPwd='${user.password}';
            	var oldPwd=$("#oldPwd").val();
            	if(oldPwd==null||oldPwd==""){
            		layer.msg('原密码不能为空!', {icon: 2});
            		return;
            	}else if(oldPwd!=userPwd){
            		layer.msg('原密码不正确，请重新输入!', {icon: 2});
            		$("#oldPwd").focus();
            		return;
            	}
            	var newPwd=$("#newPwd").val();
            	if(newPwd==null||newPwd==""){
            		layer.msg('新密码不能为空!', {icon: 2});
            		return;
            	}
            	var rePwd=$("#rePwd").val();
            	if(rePwd!=newPwd){
            		layer.msg('两次密码输入不一致!', {icon: 2});
            		$("#rePwd").focus();
            		return;
            	}
            	var json={"id":id,"password":newPwd};
            	$.post("../User_Password_Servlet",json,function(data){
        			if(data=="ok"){
        				layer.msg('修改成功!',{icon: 6,time:1000});
        			}else{
        				layer.msg('修改失败!',{icon: 5,time:1000});
        			}
        		});
            }
            //佣金提现
          	function getAvail(){
            	var bank='${user.bankName}';
            	if(bank==null||bank==""){
            		layer.msg('请先绑定银行卡，才能提现!', {icon: 2,time:1000});
            		setTimeout(gotoBank(), 1000);
            	}else{
	            	var avail=$("#avail").val();
	            	if(avail==null||avail==""){
	            		layer.msg('提现金额不能为空!', {icon: 2});
	            		return;
	            	}else if(avail<100){
	            		layer.msg('提现金额不得小于100!',{icon: 4});
	            		return;
	            	}
            	}	
            	
            }
            //绑定银行卡
            function bindBank(){
            	var id='${user.id}';
            	var realName=$("#realName").val();
            	if(realName==null||realName==""){
            		layer.msg('持卡人姓名不能为空!',{icon: 2});
            		return;
            	}
            	var bankName=$("#bankName").val();
              	if(bankName==null||bankName==""){
            		layer.msg('银行名称不能为空!',{icon: 2});
            		return;
            	}
            	var bankCard=$("#bankCard").val();
              	if(bankCard==null||bankCard==""){
            		layer.msg('银行卡号不能为空!',{icon: 2});
            		return;
            	}
            	var bankAddress=$("#bankAddress").val();
              	if(bankAddress==null||bankAddress==""){
            		layer.msg('支行地址不能为空!',{icon: 2});
            		return;
            	}
              	var json={"id":id,"realName":realName,"bankName":bankName,"bankCard":bankCard,"bankAddress":bankAddress};
        		$.post("../User_Bank_Servlet",json,function(data){
        			if(data=="ok"){
        				layer.msg('绑定成功!',{icon: 6,time:1000});
        				window.location.reload()//刷新当前页面
        				setTimeout(backAvail(), 1000);
        			}else{
        				layer.msg('绑定失败!',{icon: 5,time:1000});
        			}
        		});
            }
			//进入充值页面
			function gotoPay(){
				$("#payIframe").attr("src","money.html");
			}
			//我的资料
			function gotoInfo(){
				$("#infoBox").show();
            	$("#headBox").hide();
			}
			//tab切换
			function changeTab(id){
				 $("#tab").webwidget_scroller_tab({
                    scroller_time_interval: '5000',
                    scroller_window_padding: '10',
                    scroller_window_width: '800',
                    scroller_window_height: '500',
                    scroller_head_text_color: '#999',
                    scroller_head_current_text_color: '#1C86EE',
                    directory: 'images'
                },id);
			}
			
			//选取会员类型
			$("input:[type=radio]").click(function () {
                if ($(this).attr("checked")) {
                   $(this).parent().css("color","red");
				   $(this).parent().siblings().css("color","#0099FF");
                }
            });
			
			function availDisc(){
				//tips层-左 [绿色的]
				layer.tips('佣金来源：<br/>平台红利、出售源码所得利益，充值的金额不属于佣金，不可提现！', '#whatIsAvail', {
				  tips: [2, '#78BA32']
				});

			};
			//跳到绑定银行卡页面
			function gotoBank(){
				var card='${user.bankCard}';
            	if(card==null||card==""){
            		$("#tikuan").hide();
    				$(".bankBox").show();
            	}else{
            		layer.msg('您已经绑定过银行卡了!',{icon: 4});
            	}
			
			}
			function backAvail(){
				$("#tikuan").show();
				$(".bankBox").hide();
			}		
			//获取url?传送过来的值
			function GetQueryString(name) { 
			  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
			  var r = window.location.search.substr(1).match(reg); //获取url中"?"符后的字符串并正则匹配
			  var context = ""; 
			  if (r != null) 
				 context = r[2]; 
			  reg = null; 
			  r = null; 
			  return context == null || context == "" || context == "undefined" ? "" : context; 
			}
        </script>		
</body>
</html>
