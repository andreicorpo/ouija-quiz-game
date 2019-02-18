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
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 2 + 50),
                          child: Text(
                            'Select mode to play',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white.withOpacity(_opacityA.value),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Container(
                          child: Opacity(
                            opacity: _opacityA.value,
                            child: Column(
                              children: <Widget>[
                                FlatButton(
                                  child: Container(
                                    padding: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        'Easy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => _openQuizPage(0),
                                ),
                                FlatButton(
                                  child: Container(
                                    padding: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        'Normal',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => _openQuizPage(1),
                                ),
                                FlatButton(
                                  child: Container(
                                    padding: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        'Hardcore',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => _openQuizPage(2),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _openQuizPage(int mode) {
    if (_isAnimation1Complete) {
      this.setState(() {
        _animation = 'play';
        _opacityAC.reset();
      });
      Timer(
        const Duration(milliseconds: 670),
        () {
          Navigator.of(context).pushAndRemoveUntil(
              (MaterialPageRoute(
                builder: (BuildContext context) => QuizPage(mode),
              )),
              (Route route) => route == null);
        },
      );
    }
  }
}
