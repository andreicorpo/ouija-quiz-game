import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:ouija_quiz_game/pages/quiz_page.dart';
import 'package:ouija_quiz_game/ui/info_dialog.dart';
import 'package:ouija_quiz_game/ui/mode_button.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() {
    return new LandingPageState();
  }
}

class LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  String _animation;
  bool _isAnimationComplete = false;
  Animation _opacityA;
  AnimationController _opacityAC;

  @override
  void initState() {
    super.initState();
    _animation = 'title_reveal';
    _opacityAC =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _opacityA = Tween(begin: 0.0, end: 1.0).animate(_opacityAC)
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
            _isAnimationComplete
                ? Container()
                : Center(
                    child: FlareActor(
                      'assets/OuijaOpenPage.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: _animation,
                      callback: ((_animation) => this.setState(() {
                            _startSecondAnimation();
                            _opacityAC.forward();
                          })),
                    ),
                  ),
            _isAnimationComplete
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
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
                                ModeButton(
                                  onPress: () => _openQuizPage(0),
                                  text: 'Easy',
                                ),
                                ModeButton(
                                  onPress: () => _openQuizPage(1),
                                  text: 'Normal',
                                ),
                                ModeButton(
                                  onPress: () => _openQuizPage(2),
                                  text: 'Hardcore',
                                ),
                                ModeButton(
                                  onPress: () => _showModesInfo(),
                                  text: 'Info',
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
    if (_isAnimationComplete) {
      Navigator.of(context).pushAndRemoveUntil(
          (MaterialPageRoute(
            builder: (BuildContext context) => QuizPage(mode),
          )),
          (Route route) => route == null);
    }
  }

  _showModesInfo() {
    InfoDialog dialog = InfoDialog(context);
    showDialog(
        context: context,
        builder: (BuildContext context) => dialog.showDialog());
  }

  void _startSecondAnimation() {
    this.setState(() => _animation = 'play');
    Timer(const Duration(milliseconds: 670), () {
      _isAnimationComplete = true;
    });
  }
}
