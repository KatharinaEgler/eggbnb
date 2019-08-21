var l = 0;
var imageHeight = 174;
var ctaMargin = 0;
var TweenMax = TweenMax;
var tl = new TimelineMax({paused:false});
var textTweenTime = .5;
var zoomTime = 5;
var transitionTime = .5;
var maskEase = Sine.easeInOut;
var maskEaseIn = Power1.easeIn;
var maskEaseOut, imageEase = Power1.easeOut;
var zoomMax = 1.075;
var videoLength = 10;

function initMask() {
    TweenMax.set(mask, {height: 0});
    TweenMax.set(bar, {top: 0});
}

function openMask(myElement, pY) {
    showElement(myElement);
    TweenMax.fromTo(mask, transitionTime, {height: 0}, {height: pY, ease: maskEase});
    moveBar(pY) 
}

function closeMask(myElement, pY) {
    TweenMax.fromTo(mask, transitionTime, {height: pY}, {height: 0, ease: maskEase});
    moveBar(0) 
    TweenMax.delayedCall(transitionTime, removeElement, [myElement])
}

function moveBar(pX) {
    TweenMax.to(bar, transitionTime, {top: pX, ease: maskEase, delay: 0.000});
}

function removeElement(myElement) {
    TweenMax.set(myElement, {autoAlpha: 0});
}

function showElement(myElement) {
    TweenMax.set(myElement, {autoAlpha: 1});
}

function resumeTL(t) {
    tl.pause();
    TweenMax.delayedCall(t, function() {tl.resume();})
}

function fadeOut() {
    l++;
    if (l<2) {
        tl.addLabel("fadeOut")
        // .to(text2, .5, {autoAlpha: 0, ease:maskEaseIn}, "fadeOut")
        // .to(cta, .5, {autoAlpha: 1, ease:maskEaseIn},  "fadeOut")
        .addCallback(closeMask, "fadeOut",  [text2, imageHeight], this)
        .addCallback(restartBanner, "+=.5",  [], this);
     }
    else {
        tl.pause();
    }
}



function restartBanner() {
    var mediaElement = document.getElementById("video"); 
    mediaElement.currentTime = 0;
    mediaElement.play();
   
    tl.play("start");
}

// Calculating button text width in pixels
function getImageWidth () {
    var test = document.getElementById("cta_off");
  
    var width = (test.clientWidth + 1);

    return width;
};

function initCTA() {
    var margin = 8;
    var w = getImageWidth() + margin*2;
    var cta = document.getElementById("cta");
    TweenMax.set(cta, {width: w});
    TweenMax.set(cta_off, {left: margin});
    
    var cta = document.getElementById("cta");
    cta.onmouseover = function () {
        TweenMax.to(cta_off, .01, {webkitFilter: "invert(100)", filter: "invert(100)"});
   }
    
    cta.onmouseout = function () {
        TweenMax.to(cta_off, .01, {webkitFilter: "invert(0)", filter: "invert(0)"});
   }
}


function checkLoad(v) {
        var myVideo = document.getElementById(v)    
    
        if (myVideo.readyState === 4) {
            animateBanner(); 
        } else {
            setTimeout(checkLoad, 100, v);
        }
}


function initBanner() {

    checkLoad("video");
    
}


function animateBanner() {
   
   
    TweenMax.set(bannerContent, {autoAlpha: 1});

    initCTA();
    initMask();
    
    video.onended = function(evt) {
        // evt.currentTarget.currentTime = 0;
        evt.currentTarget.pause();
        // resumeTL(0);
        tl.play("closeVideo")
     }
    

    TweenMax.set(text2, {autoAlpha: 0});
    
    tl.addLabel("start") 
  
    .addCallback(openMask, "start",  [video, imageHeight], this)
    .set(jcw_logo, {autoAlpha: 1}, "start")

    
    .addLabel("closeVideo", transitionTime)
    .addPause("closeVideo")
    .call(closeMask, [jcw_logo, imageHeight], this)

    .set(video, {autoAlpha: 0}, "+=0.5")
    .set(jcw_logo, {autoAlpha: 0}, "+=0.5")
    .addCallback(openMask, "-=0.5",  [text2, imageHeight], this)
    
    .addCallback(fadeOut, "+=5",  [], this)

 
}

