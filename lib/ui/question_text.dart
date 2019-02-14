import 'package:flutter/material.dart';
import 'package:ouija_quiz_game/ui/arch_clipper_bottom.dart';
import 'package:ouija_quiz_game/ui/overlay.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;
  final bool _overlayShouldBeVisible;
  final bool _isCorrect;
  final String _answerCorrect;

  QuestionText(this._question, this._questionNumber,
      this._overlayShouldBeVisible, this._isCorrect, this._answerCorrect);

  @override
  State<StatefulWidget> createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAC;

  @override
  void initState() {
    super.initState();
    _fontSizeAC =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _fontSizeAnimation =
        CurvedAnimation(parent: _fontSizeAC, curve: Curves.elasticInOut);
    _fontSizeAnimation.addListener(() => setState(() {}));
    _fontSizeAC.forward();
  }

  @override
  void dispose() {
    _fontSizeAC.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAC.reset();
      _fontSizeAC.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ClipPath(
        clipper: ArchClipperBottom(),
        child: Material(
          child: Stack(
            children: [
              new MainPart(widget: widget, fontSizeAC: _fontSizeAC),
              Center(
                child: widget._overlayShouldBeVisible
                    ? ResultOverlay(widget._isCorrect,
                        MediaQuery.of(context).size, widget._answerCorrect)
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainPart extends StatelessWidget {
  const MainPart({
    Key key,
    @required this.widget,
    @required AnimationController fontSizeAC,
  })  : _fontSizeAC = fontSizeAC,
        super(key: key);

  final QuestionText widget;
  final AnimationController _fontSizeAC;

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
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _fontSizeAC,
              builder: (BuildContext context, Widget child) {
                return Text(
                  'Question #${widget._questionNumber}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: _fontSizeAC.value * 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
            ),
            AnimatedBuilder(
              animation: _fontSizeAC,
              builder: (BuildContext context, Widget child) {
                return Transform.scale(
                  child: Text(
                    '${widget._question.replaceAll('amp;', '')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(offset: Offset(1.0, 1.0), color: Colors.black12),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  scale: _fontSizeAC.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
