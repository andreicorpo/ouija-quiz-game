import 'dart:async';

import './overlay_reveal_painter.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ResultOverlay extends StatefulWidget {
  final bool _isCorrect;
  final Size _screenSize;
  final String _answer;

  ResultOverlay(this._isCorrect, this._screenSize, this._answer);

  @override
  State<StatefulWidget> createState() {
    return new _ResultOverlayState();
  }
}

class _ResultOverlayState extends State<ResultOverlay>
    with TickerProviderStateMixin {
  Random _random = Random();
  String _response;
  List<String> _responseCorrect = [
    'Correct!',
    'U good',
    '\"It\'s not much,\nbut at least it\'s honest work\"',
    'Show \'em who\'s the boss',
    'Brutal',
    'Aweeesome',
    'I knew you can do it',
  ];
  List<String> _responseIncorrect = [
    'Noob',
    'Wroooooong',
    'Incorrect',
    'LosER',
    'Come on, dude, try harder',
    'Maybe next time...\nOr never',
  ];
  var _finalRadius;

  Animation<double> _animation1;
  Animation<double> _animation2;
  AnimationController _animation1C;
  AnimationController _animation2C;

  @override
  void initState() {
    super.initState();
    _response = widget._isCorrect
        ? _responseCorrect[_random.nextInt(_responseCorrect.length)]
        : _responseIncorrect[_random.nextInt(_responseIncorrect.length)];
    _finalRadius = sqrt(pow(widget._screenSize.height / 2, 2) +
        pow(widget._screenSize.height / 2, 2));

    _animation1C = new AnimationController(
        duration: new Duration(seconds: 1), vsync: this);

    _animation1 =
        new CurvedAnimation(parent: _animation1C, curve: Curves.elasticOut);

    _animation1.addListener(() => this.setState(() {}));

    _animation2C = new AnimationController(
        duration: new Duration(seconds: 10), vsync: this);
    _animation2 =
        new CurvedAnimation(parent: _animation2C, curve: Curves.elasticOut);
    _animation2.addListener(() => this.setState(() {}));

    _animation2C.forward();

    Timer(new Duration(milliseconds: 500), () => _animation1C.forward());
  }

  @override
  void dispose() {
    _animation1C.dispose();
    _animation2C.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: CustomPaint(
        painter:
            RevealPainter(widget._isCorrect, _animation2.value * _finalRadius),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                child: Transform.rotate(
              angle:
                  _animation1.value * 2 * pi + (widget._isCorrect ? 0 : pi / 4),
              child: new Icon(
                  widget._isCorrect ? Icons.check_circle : Icons.add_circle,
                  size: _animation1.value * 70.0,
                  color: Colors.white),
            )),
            Container(
              padding: EdgeInsets.all(8.0),
              child: new Text(
                '$_response',
                style: new TextStyle(
                  fontSize: _animation1.value * 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: new Text(
                widget._isCorrect ? '' : 'Ouija said: ${widget._answer}',
                style: new TextStyle(
                  fontSize: _animation1.value * 16.0,
                  color: Colors.white30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
