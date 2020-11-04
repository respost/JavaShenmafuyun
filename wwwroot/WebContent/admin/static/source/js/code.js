// JavaScript Document
/*源码-编辑*/
function code_edit(id,pageIndex){
	var index = layer.open({
		type: 2,
		title: '编辑源码',
		content: 'code_add.jsp?sname=edit&cid='+id+'&pageIndex='+pageIndex
	});
	layer.full(index);
}
/*源码-删除*/
function code_del(id,pageIndex){
	layer.confirm('确认要删除吗？',function(index){
		var cid=id;
		var json={"cid":cid};
		$.post("../../../Code_Del_Servlet",json,function(data){
			
			if(data=="ok"){
				layer.msg('已删除!',{icon:1,time:1000});
				getCodeList(pageIndex);
			}else{
				layer.msg('删除失败!',{icon: 5,time:1000});
			}
			
		});
	});
}

/*源码-审核*/
function code_shenhe(id,pageIndex){
	layer.confirm('审核源码？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){	
		var cid=id;
		var status=1;
		var json={"cid":cid,"status":status};
		$.post("../../../Code_Status_Servlet",json,function(data){
			
			if(data=="ok"){
				layer.msg('已上架!',{icon: 6,time:1000});
				getCodeList(pageIndex);
			}else{
				layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
			}
			
		});
	},
	function(){
		var cid=id;
		var status=3;
		var json={"cid":cid,"status":status};
		$.post("../../../Code_Status_Servlet",json,function(data){
			
			if(data=="ok"){
				layer.msg('不合格!',{icon: 5,time:1000});
				getCodeList(pageIndex);
			}else{
				layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
			}
			
		});
	});	
}
/*源码-下架*/
function code_stop(id,pageIndex){
	layer.confirm('确认要下架吗？',function(index){
		var cid=id;
		var status=2;
		var json={"cid":cid,"status":status};
		$.post("../../../Code_Status_Servlet",json,function(data){
			
			if(data=="ok"){
				layer.msg('已下架!',{icon: 5,time:1000});
				getCodeList(pageIndex);
			}else{
				layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
			}
			
		});
		
	});
}

/*源码-上架*/
function code_start(id,pageIndex){
	layer.confirm('确认要上架吗？',function(index){
		var cid=id;
		var status=1;
		var json={"cid":cid,"status":status};
		$.post("../../../Code_Status_Servlet",json,function(data){
			
			if(data=="ok"){
				layer.msg('已上架!',{icon: 6,time:1000});
				getCodeList(pageIndex);
			}else{
				layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
			}
			
		});
		
	});
}
/*源码-申请上线*/
function code_shenqing(id,pageIndex){
	var cid=id;
	var status=0;
	var json={"cid":cid,"status":status};
	$.post("../../../Code_Status_Servlet",json,function(data){
		
		if(data=="ok"){
			layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
			getCodeList(pageIndex);
		}else{
			layer.msg('连接失败,请重新尝试!',{icon: 5,time:1000});
		}
		
	});
	
}

