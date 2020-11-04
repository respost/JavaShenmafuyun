//幻灯片jQuery代码
$(document).ready(function() {
       foucsbox(2000);
});

function foucsbox (time) {
    var time = time || 100
    , $ = function (id) { return document.getElementById(id); }
    , box = $('flashBox')
    , big = $('flashImg')
    , samll = $('smallPic')
    , tip = $('flashTitle')
    , bigimgs = big.getElementsByTagName('li')
    , samllimgs = samll.getElementsByTagName('li')
    , imglink = tip.getElementsByTagName('a')[0]
    , slide = function (z) {
        samllimgs[lastIndex].className = '';
        samllimgs[z].className = 'current';
        bigimgs[lastIndex].style.display = 'none';
        bigimgs[z].style.display = 'block';
        try {
            imglink.innerHTML = samllimgs[z].getElementsByTagName('img')[0].alt;
        }
        catch (e) {
            imglink.innerText = samllimgs[z].firstChild.firstChild.alt;
        }
        lastIndex = i = z;
    }
    , helper = function (z) {
        return function (e) {
            var na;
            if (!e) {
                e = window.event;
                na = e.srcElement.nodeName;
            }
            else {
                na = e.target.nodeName;
            }
            if (na === 'IMG') {
                slide(z);
            }
        }
    }
    , lastIndex = i = 0, x, y = bigimgs.length
    , getPrevI = function (q) { return i - q < 0 ? y - q : i - 1; }
    , getNextI = function (q) { return i + q >= y ? i + q - y : i + 1; }
    var s = setInterval(function () {
        slide(i);
        i = getNextI(1);
    }, time);
    try {
        imglink.innerText = samllimgs[0].getElementsByTagName('img')[0].alt;
    }
    catch (e) {
        imglink.innerText = samllimgs[0].firstChild.firstChild.alt;
    }
    for (x = 1; x < y; x += 1) {
        bigimgs[x].style.display = 'none';
    }
    for (x = 0; x < y; x += 1) {
        samllimgs[x].onmouseover = helper(x);
    }
    box.children[2].onclick = function (e) {
        i = lastIndex;
        var t;
        if (!e) {
            e = window.event;
            t = e.srcElement;
        } else {
            t = e.target;
        }
        switch (t.className) {
            case 'icon_prev':
                slide(getPrevI(1));
                break;
            case 'icon_next':
                slide(getNextI(1));
                break;
        }
    };
    box.onmouseover = function () {
        clearInterval(s);
    };
    box.onmouseout = function () {
        s = setInterval(function () {
            slide(i);
            i = getNextI(1);
        }, time);
    };
};