import 'dart:math';

import 'package:flutter/material.dart';
class OtherStatus extends StatelessWidget {
final String name;
final String time;
final String img;
final bool isSeen;
final int statusNum;
OtherStatus({this.name,this.time,
  this.img,this.isSeen,this.statusNum});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StutasPinter(isSeen: isSeen,statusNum: statusNum),
        child: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage(img),
        ),
      ),
      title: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      subtitle: Text(time,style: TextStyle(fontSize: 13,)),

    );
  }
}

degreeIoAngle(double degree){
  return degree * pi / 180 ;
}
class StutasPinter extends CustomPainter{
  bool isSeen;
  int statusNum;
  StutasPinter({this.isSeen,this.statusNum});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
        ..isAntiAlias = true
        ..strokeWidth= 7.0
        ..color= isSeen ?Colors.grey:Colors.blue
        ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);

  }
  void drawArc(Canvas canvas ,Size size ,Paint paint){
    if(statusNum== 1){
      canvas.drawArc(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        degreeIoAngle(0),
        degreeIoAngle(360),
        false,
        paint,
      );
    }
    else{
      double degree = 90;
      double arc = 360 / statusNum ;
      for(int i=0; i< statusNum ;i++ ){
        canvas.drawArc(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeIoAngle(degree+4),
          degreeIoAngle(arc -8 ),
          false,
          paint,
        );
        degree += arc;
      }

    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

}