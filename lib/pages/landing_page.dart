import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:ouija_quiz_game/pages/quiz_page.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() {
    return new LandingPageState();
  }
}

class LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  String _animation;
  bool _isAnimation1Complete = false;
  Animation _opacityA;
  AnimationController _opacityAC;

  @override
  void initState() {
    super.initState();
    _animation = 'title_reveal';
    _opacityAC =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _opacityA = Tween(begin: 0.0, end: 0.5).animate(_opacityAC)
      ..addListener(() => this.setState(() {}));
  }

  @override
  void dispose() {
    _opacityAC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.blue,
            Colors.blueAccent[700],
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: _isAnimation1Complete
              ? () {
                  this.setState(() {
                    _animation = 'play';
                    _opacityAC.reset();
                  });
                  Timer(
                    const Duration(milliseconds: 670),
                    () {
                      Navigator.of(context).pushAndRemoveUntil(
                          (MaterialPageRoute(
                            builder: (BuildContext context) => QuizPage(),
                          )),
                          (Route route) => route == null);
                    },
                  );
                }
              : () {},
          child: Stack(
            children: <Widget>[
              Center(
                child: FlareActor(
                  'assets/OuijaOpenPage.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: _animation,
                  callback: ((_animation) => this.setState(() {
                        _isAnimation1Complete = true;
                        _opacityAC.forward();
                      })),
                ),
              ),
              _isAnimation1Complete
                  ? Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 200.0),
                        child: Text(
                          'Tap to play',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white.withOpacity(_opacityA.value),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
