import 'package:flutter/material.dart';

class RevealPainter extends CustomPainter {
  final bool _isCorrect;

  double _radius;

  RevealPainter(this._isCorrect, this._radius);

  Gradient _correctGradient = LinearGradient(
    colors: [
      Colors.lightGreenAccent[100],
      Colors.lightGreen,
      Colors.green[700],
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  Gradient _wrongGradient = LinearGradient(
    colors: [
      Colors.redAccent,
      Colors.red[700],
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.shader = _isCorrect
        ? _correctGradient
            .createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
        : _wrongGradient
            .createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), _radius, paint);
  }

  @override
  bool shouldRepaint(RevealPainter oldDelegate) =>
      _radius != oldDelegate._radius;
}
