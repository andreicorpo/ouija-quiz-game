import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  final String _answer;
  final VoidCallback _onTap;

  AnswerButtons(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                child: Text(
                  'A',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              AnswerButton(answer: _answer, onTap: _onTap),
            ],
          ),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  AnswerButton({
    Key key,
    @required String answer,
    @required onTap,
  })  : _answer = answer.replaceFirst('Ouija says: ', ''),
        _onTap = onTap,
        super(key: key) {
    _answer.replaceFirst('Ouija says: ', '');
  }

  final String _answer;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: FlatButton(
        child: Text(
          '$_answer',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        onPressed: _onTap,
      ),
    );
  }
}
