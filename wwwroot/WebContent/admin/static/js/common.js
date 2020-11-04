// JavaScript Document	    		
	 
	function getFileName(file){
	    var pos=file.lastIndexOf("\\");
	       return file.substring(pos+1); 
	}
	//get url?
	function GetQueryString(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
		var r = window.location.search.substr(1).match(reg); 
		var context = ""; 
		if (r != null) 
		   context = r[2]; 
		 reg = null; 
		 r = null; 
		 return context == null || context == "" || context == "undefined" ? "" : context; 
	}
	//date format
	Date.prototype.format = function(fmt) { 
	     var o = { 
	        "M+" : this.getMonth()+1,                 
	        "d+" : this.getDate(),                    
	        "h+" : this.getHours(),                   
	        "m+" : this.getMinutes(),                
	        "s+" : this.getSeconds(),                 
	        "q+" : Math.floor((this.getMonth()+3)/3), 
	        "S"  : this.getMilliseconds()             
	    }; 
	    if(/(y+)/.test(fmt)) {
	            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	    }
	     for(var k in o) {
	        if(new RegExp("("+ k +")").test(fmt)){
	             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	         }
	     }
	    return fmt; 
	};