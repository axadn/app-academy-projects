document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  var ctx = canvas.getContext('2d');

  ctx.fillStyle = 'rgb(255,232,138)';
  ctx.fillRect(0,140,200,100);

  //aloha
  ctx.moveTo(60,150);
  ctx.bezierCurveTo(70,160, 82,160, 93, 150);
  ctx.bezierCurveTo(92, 120,93, 101,101,64);
  ctx.bezierCurveTo(113,86, 119, 102, 117, 124);
  ctx.bezierCurveTo(140, 96, 151, 84, 126, 50);
  ctx.bezierCurveTo( 138, 50, 148, 60, 149, 70);
  ctx.bezierCurveTo(160, 47, 148, 34, 126, 34);
  ctx.bezierCurveTo(129, 27, 133, 28, 142, 29);
  ctx.bezierCurveTo(135, 18, 116,9, 102, 22);
  ctx.bezierCurveTo(75,3,75,7,51,26);
  ctx.bezierCurveTo(68,24,75,28,83,35);
  ctx.bezierCurveTo(34,24,29,30,38,96);
  ctx.bezierCurveTo(52,69,61,62,88,57);
  ctx.bezierCurveTo(59,107,62,118,60,150);
  ctx.lineWidth = 2;;
  ctx.fillStyle= "rgb(48,180,70)";
  ctx.strokeStyle = "rgb(48,250,115)";
  ctx.stroke()
  ctx.fill();

  ctx.beginPath();
  ctx.arc(90,50,11,0,2*Math.PI, true);
  ctx.lineWidth = 2;
  ctx.strokeStyle = "rgb(244,184,22)";
  ctx.fillStyle = "rgb(157,106,25)";
  ctx.stroke();
  ctx.fill();

  ctx.beginPath();
  ctx.arc(108,45,9,0,2*Math.PI, true);
  ctx.stroke();
  ctx.fill();

  ctx.beginPath();
  ctx.fillStyle = "rgb(130,85,20)";
  ctx.arc(103,60,9,0,2*Math.PI, true);
  ctx.stroke();
  ctx.fill();
});
