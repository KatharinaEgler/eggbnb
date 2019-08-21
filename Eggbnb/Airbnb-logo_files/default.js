var STAGE_WIDTH = 300;
var STAGE_HEIGHT = 600;

var tl = new TimelineMax();

$(document).ready(function(){
  $("#exit").click(function(){
      window.open(window.clickTag);
  });

  $("#exit").mouseover(function(){
    rollOverCTA();
  });

  $("#exit").mouseout(function(){
    rollOutCTA();
  });

  runAd();
});

// ---------------------------------------------------------------------------------
// Ad animation!
// ---------------------------------------------------------------------------------
function runAd() {

  var slideVariance = 10;
  var slideTime = 6;

  $("#exit").css("display", "block");
  $("#ad").css("display", "block");

  TweenMax.set([".force3d"], {rotationZ: 0.01,force3D:true});

  tl.fromTo("#bg1", slideTime, {x:-slideVariance*2}, {x:0, ease:Linear.easeNone}, "+=0");

  tl.fromTo("#bg2", slideTime, {x:-slideVariance*2}, {x:0, ease:Linear.easeNone}, "-=4.25");
  tl.set("#bg2", {autoAlpha:1}, "-=4.25");
  tl.set("#text1", {autoAlpha:0}, "-=4.25");
  tl.set("#text2", {autoAlpha:1}, "-=4.25");

  tl.fromTo("#bg3", slideTime, {x:-slideVariance*4}, {x:-slideVariance*2, ease:Quad.easeOut}, "-=3.25");
  tl.set("#bg3", {autoAlpha:1}, "-=3.25");
  tl.set("#text2", {autoAlpha:0}, "-=3.25");
  tl.set("#text3a", {autoAlpha:1}, "-=3.25");
  tl.to("#text3b", 1, {autoAlpha:1}, "-=2");

  tl.to("#cta", 0.5, {autoAlpha:1}, "-=1");
  tl.to("#text3c", 0.5, {autoAlpha:1}, "-=1");

  // tl.pause(6);

}


function rollOverCTA(){
    TweenMax.to("#cta", 0.5, {css:{backgroundColor:"#910A2D", color:"#ffffff"}});
}

function rollOutCTA(){
  TweenMax.to("#cta", 0.5, {css:{backgroundColor:"#ffffff", color:"#000000"}});
}

