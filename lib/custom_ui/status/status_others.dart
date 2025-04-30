import 'dart:math';

import 'package:flutter/material.dart';

class StatusOthers extends StatelessWidget {
  final String? name;
  final String? time;
  final String? imageName;
  final bool? isSeen;
  final int? statusFreq;

  const StatusOthers({super.key, this.name, this.time, this.imageName, this.isSeen, this.statusFreq});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(isSeen: isSeen, statusFreq: statusFreq),
        child: CircleAvatar(radius: 26, backgroundImage: AssetImage(imageName ?? "")),
      ),
      title: Text(name ?? "", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      subtitle: Text("Today at, ${time ?? 'Unknown'}", style: TextStyle(fontSize: 14, color: Colors.grey[900])),
    );
  }
}

class StatusPainter extends CustomPainter {
  bool? isSeen;
  int? statusFreq;

  StatusPainter({required this.isSeen, required this.statusFreq});

  @override
  //what will be painted
  void paint(Canvas canvas, Size size) {
    //setting the paint properties
    final Paint paint =
        Paint()
          ..isAntiAlias = true
          ..strokeWidth = 6.0
          ..color = isSeen == null ? Colors.grey : (isSeen == true ? Colors.grey : Color(0xff21bfa6))
          ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  //drawing the shape (circle)
  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusFreq == 1) {
      canvas.drawArc(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        degreeToAngle(0),
        degreeToAngle(360),
        false,
        paint,
      );
    } else {
      //circles math.
      double degree = -90;
      double arc = 360 / statusFreq!;
      for (int i = 0; i < statusFreq!; i++) {
        canvas.drawArc(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(degree + 4), //+4 is UI gap
          degreeToAngle(arc - 8), //-8 is UI gap
          false,
          paint,
        );
        degree += arc;
      }
    }
  }

  @override
  //determines if will be painted.
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  //convert degrees to radians
  degreeToAngle(double degree) {
    return degree * pi / 180;
  }
}
