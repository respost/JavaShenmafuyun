(function(a,tabId){
    a.fn.webwidget_scroller_tab=function(p,tabId){
        var p=p||{};

        //var s_t_i=p&&p.scroller_time_interval?p.scroller_time_interval:"3000";
        var s_w_p=p&&p.scroller_window_padding?p.scroller_window_padding:"5";
        var s_w_w=p&&p.scroller_window_width?p.scroller_window_width:"350";
        var s_w_h=p&&p.scroller_window_height?p.scroller_window_height:"270";
        var s_h_t_c=p&&p.scroller_head_text_color?p.scroller_head_text_color:"blue";
        var s_h_c_t_c=p&&p.scroller_head_current_text_color?p.scroller_head_current_text_color:"black";
        var d=p&&p.directory?p.directory:"images";
        var dom=a(this);
        var s_length=dom.children(".tabBody").children("ul").children("li").length;
        var timer;
        var current = tabId;
        var li_width;
        s_w_p += "px";
        s_w_w += "px";
        s_w_h += "px";
        
        if(dom.find("ul").length==0||dom.find("li").length==0){
            dom.append("Require content");
            return null;
        }
        begin();
        play();
        function begin(){
            dom.width(s_w_w);
            dom.height(s_w_h);
            li_width = parseInt(s_w_w)-2;
            dom.children(".tabBody").width(parseInt(s_w_w)-2);
            dom.children(".tabBody").height(parseInt(s_w_h)-28-4);
            dom.children(".tabBody").children("ul").width((parseInt(s_w_w)-2)*s_length);
            dom.children(".tabBody").children("ul").height(parseInt(s_w_h)-28-4);
            dom.children(".tabBody").children("ul").children("li").width(parseInt(s_w_w)-2);
            dom.children(".tabBody").children("ul").children("li").height(parseInt(s_w_h)-28-4);
            dom.children(".tabBody").children("ul").children("li").children("p").css("padding",s_w_p);
            dom.children(".tabContainer").children(".tabHead").children("li").children("a").css("color",s_h_t_c);
            dom.children(".tabContainer").children(".tabHead").children("li").children("a").click(function(){
                current = dom.children(".tabContainer").children(".tabHead").children("li").index($(this).parent());
                play();
                stop()
            });
           dom.hover(
                function(){
                    stop();
                },
                function(){
                    timer = setTimeout(play,s_t_i);
                }
            );
        }
        function stop(){
            clearTimeout(timer);
        }
        function play(){
            clearTimeout(timer);
            var to_location = -(current*li_width)+"px";
            dom.children(".tabBody").children("ul").animate({
                left:to_location
            },500);
            dom.children(".tabContainer").children(".tabHead").children("li").children("a").css("color",s_h_t_c);
            dom.children(".tabContainer").children(".tabHead").children("li").removeClass("currentBtn")
            dom.children(".tabContainer").children(".tabHead").children("li").eq(current).children("a").css("color",s_h_c_t_c);
            dom.children(".tabContainer").children(".tabHead").children("li").eq(current).addClass("currentBtn");
            if(current >= s_length-1){
                current = 0;
            }else{
                current ++;
            }
            timer = setTimeout(play,s_t_i);
        }
    }
})(jQuery);