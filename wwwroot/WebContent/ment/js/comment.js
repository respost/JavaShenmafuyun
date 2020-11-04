(function($) {
    $.fn.extend({
        insertContent: function(myValue, t) {
            var $t = $(this)[0];
            if (document.selection) { //ie
                this.focus();
                var sel = document.selection.createRange();
                sel.text = myValue;
                this.focus();
                sel.moveStart('character', -l);
                var wee = sel.text.length;
                if (arguments.length == 2) {
                    var l = $t.value.length;
                    sel.moveEnd("character", wee + t);
                    t <= 0 ? sel.moveStart("character", wee - 2 * t - myValue.length) : sel.moveStart("character", wee - t - myValue.length);
  
                    sel.select();
                }
            } else if ($t.selectionStart || $t.selectionStart == '0') {
                var startPos = $t.selectionStart;
                var endPos = $t.selectionEnd;
                var scrollTop = $t.scrollTop;
                $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
                this.focus();
                $t.selectionStart = startPos + myValue.length;
                $t.selectionEnd = startPos + myValue.length;
                $t.scrollTop = scrollTop;
                if (arguments.length == 2) {
                    $t.setSelectionRange(startPos - t, $t.selectionEnd + t);
                    this.focus();
                }
            }
            else {
                this.value += myValue;
                this.focus();
            }
        }
    })
	
		var praise=document.getElementById('praise');
          //点赞
        praise.onclick = function () {
      		praiseBox();
        }
	
	    function praiseBox() {
			var el=document.getElementById('praise');
			var txt = el.innerHTML; 
			var praisesTotal= document.getElementById('praises-total');
			var oldTotal=  parseInt(praisesTotal.getAttribute('total'));
			var newTotal;
			if (txt == '赞') {
				newTotal = oldTotal + 1;
				praisesTotal.setAttribute('total', newTotal);
				praisesTotal.innerHTML = (newTotal == 1) ? '我觉得很赞' : '我和' + oldTotal + '个人觉得很赞';
				el.innerHTML = '取消赞';
			}
			else {
				newTotal = oldTotal - 1;
				praisesTotal.setAttribute('total', newTotal);
				praisesTotal.innerHTML = (newTotal == 0) ? '' : newTotal + '个人觉得很赞';
				el.innerHTML = '赞';
			}
			praisesTotal.style.display = (newTotal == 0) ? 'none' : 'block';
    	}


})(jQuery);
