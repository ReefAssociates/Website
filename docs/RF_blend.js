var tiles = 9    // number of tiles
var total = 25   // total number of small pictures
var totalfs = 10 // total number of full size pictures
var speed = 300  // time between changes (milliseconds)
var mix, i, j
var pic = new Array(total)
var picfs = new Array(totalfs)
var preLoad = new Array()
var preLoadfs = new Array()

preLoad[0] = new Image;
preLoad[0].src = "images/home/0.jpg";

// shuffle images
for (i = 1; i <= total; i++) {
    mix = Math.floor(Math.random() * i) + 1;
    pic[i] = pic[mix];
    pic[mix] = i;
}

// preload images, in the order they will be displayed
for (i = 1; i <= total; i++) {
    preLoad[i] = new Image;
    preLoad[i].src = "images/home/" + pic[i] + ".jpg";
}

// shuffle full size images
for (i = 1; i <= totalfs; i++) {
    mix = Math.floor(Math.random() * i) + 1;
    picfs[i] = picfs[mix];
    picfs[mix] = i;
}

// preload full size images, in the order they will be displayed
for (i = 1; i <= totalfs; i++) {
    for (j = 1; j <= 9; j++) {
        preLoadfs[j + ((i - 1) * 9)] = new Image;
        preLoadfs[j + ((i - 1) * 9)].src = "images/home/whole/" + picfs[i] + "_" + j + ".jpg";
    }
}

var t = 0, p = 1, fs = 0, fno, timeout = 0, pfs = 1
var tile = new Array(tiles)

// shuffle tile sequence
for (i = 0; i < tiles; i++) {
    mix = Math.floor(Math.random() * i);
    tile[i] = tile[mix];
    tile[mix] = i;
}

function blendit() {

    if (t == tiles) {
        t = 0;
        speed = 500
    }			// Slow down after all tiles filled
    if (timeout) {
        timeout = 0;
        speed = 500
    }		// Speed up after large image pause

    if (document.all) {
        document.images["tile" + tile[t]].style.filter = "blendTrans(duration=2)";
        document.images["tile" + tile[t]].filters.blendTrans.apply();
    }

    if (p == total) {					// At the end of a cycle
        fs++;
        fno = (pfs * 9) + tile[t] - 8;
        document.images["tile" + tile[t]].src = preLoadfs[fno].src;
        if (fs == tiles) {
            if (pfs == totalfs) {
                pfs = 0
            }
            pfs++;
            p = 1;
            fs = 0;
            speed = 3000;
            timeout = 1;
        }
    } else {
        fno = p;
        p++;
        document.images["tile" + tile[t]].src = preLoad[fno].src;
    }

    if (document.all) {
        document.images["tile" + tile[t]].filters.blendTrans.play();
    }

    t++
    setTimeout("blendit()", speed)
}

function delayblend() {
    setTimeout("blendit()", 1000)
}
