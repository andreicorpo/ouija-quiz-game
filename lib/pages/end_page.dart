import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ouija_quiz_game/utils/answered_question.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:ouija_quiz_game/pages/quiz_page.dart';

class EndPage extends StatelessWidget {
  final int _score;
  final int _totalQuestions;
  final List<AnsweredQuestion> _answeredQuestion;

  EndPage(this._score, this._totalQuestions, this._answeredQuestion);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
      accentColor: Colors.white,
      splashColor: Colors.transparent,
      unselectedWidgetColor: Colors.white,
    );

    return Theme(
      child: new Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[900],
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => _buildBody(index),
            itemCount: _answeredQuestion.length,
          ),
        ),
      ),
      data: theme,
    );
  }

  _buildBody(int index) {
    if (index == 0) {
      return Column(
        children: <Widget>[
          new Beginning(),
          _buildTile(index),
        ],
      );
    } else if (index == _answeredQuestion.length - 1) {
      return Column(
        children: <Widget>[
          _buildTile(index),
          Ending(_score, _answeredQuestion.length),
        ],
      );
    } else {
      return _buildTile(index);
    }
  }

  _buildTile(int index) {
    final Gradient _correctGradient = LinearGradient(colors: [
      Colors.lightGreen,
      Colors.green,
    ]);

    final Gradient _wrongGradient = LinearGradient(colors: [
      Colors.redAccent,
      Colors.red,
    ]);

    AnsweredQuestion _question = _answeredQuestion[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black45,
                spreadRadius: 1.5,
                blurRadius: 2.0,
                offset: Offset(0.0, 2.0)),
          ],
          borderRadius: BorderRadius.circular(36.0),
          // border: Border.all(
          //   width: 3,
          //   color: Colors.white70,
          // ),
          gradient: _question.wasCorrect ? _correctGradient : _wrongGradient,
        ),
        child: ExpansionTile(
          leading: Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.0, 1.0),
                  )
                ]),
            child: Icon(
              _question.wasCorrect ? Icons.done : Icons.clear,
              color:
                  _question.wasCorrect ? Colors.lightGreen : Colors.redAccent,
              size: 35.0,
            ),
          ),
          title: Text(
            _question.question,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(color: Colors.black12, offset: Offset(1.0, 1.0))
              ],
            ),
          ),
          children: <Widget>[
            Divider(
              color: Colors.white70,
              indent: 70.0,
            ),
            SubListTile('OUIJA', _question.answer),
            SubListTile('YOU', _question.userAnswer),
            _question.question.contains('_')
                ? SubListTile(
                    'COMPLETED QUESTION',
                    _question.question
                        .replaceAll(RegExp(r'_+'), _question.answer),
                  )
                : Container(),
            SubListTile('GUESSED PERCENTAGE',
                '${((_question.userAnswer.replaceAll('_', '').length / _question.answer.length) * 100).toStringAsFixed(2)}%'),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
            ),
            OpenPost(
              question: _question,
            ),
          ],
        ),
      ),
    );
  }
}

class Beginning extends StatelessWidget {
  const Beginning({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Text(
          'This round\'s questions',
          style: TextStyle(
              color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OpenPost extends StatelessWidget {
  final AnsweredQuestion _question;

  const OpenPost({
    Key key,
    @required question,
  })  : _question = question,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(_question.questionURL)) {
          await launch(_question.questionURL);
        } else {
          throw 'Could not launch ${_question.questionURL}';
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
            // border: Border.all(width: 3.0, color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.open_in_new,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                ),
                Text(
                  'Liked this Question? Upvote it on Reddit!',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black12, offset: Offset(1.0, 1.0))
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubListTile extends StatelessWidget {
  final String _leadingText;
  final String _mainText;

  const SubListTile(this._leadingText, this._mainText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30.0),
            // border: Border.all(
            //   width: 3.0,
            //   color: Colors.white,
            // ),
          ),
          width: 120.0,
          height: 60.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                _leadingText,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(color: Colors.black12, offset: Offset(1.0, 1.0))
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        title: Text(
          _mainText,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [Shadow(color: Colors.black12, offset: Offset(1.0, 1.0))],
          ),
        ),
      ),
    );
  }
}

class Ending extends StatelessWidget {
  final int _score;
  final int _totalQuestions;

  const Ending(this._score, this._totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Text(
            'Thanks for playing!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 24.0)),
          Text(
            'You\'ve guessed correctly\n ${(_score / _totalQuestions * 100).toStringAsFixed(2)}% of the questions',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 12.0)),
          Text(
            'Did you enjoy the game?\nIf you did, check out the awesome subreddit where all these questions come from',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 12.0)),
          FlatButton(
            child: Text(
              'r/AskOuija',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              final url = 'https://www.reddit.com/r/AskOuija/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 12.0)),
          Text(
            'Feedback is also very much appreciated',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 12.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 16.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                    ),
                    Text(
                      'E-mail',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onPressed: () async {
                  final mailUrl =
                      'mailto:<andrei.corpodeanu@gmail.com>?subject=Ouija Quiz Feedback&body=';
                  if (await canLaunch(mailUrl)) {
                    await launch(mailUrl);
                  } else {
                    throw 'Could not launch $mailUrl';
                  }
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 24.0)),
          Padding(padding: EdgeInsets.only(bottom: 24.0)),
          Text(
            'Play again',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 18.0)),
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.replay,
                  color: Colors.black,
                  size: 40.0,
                ),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => QuizPage()),
                  (Route route) => route == null),
            ),
          )
        ],
      ),
    );
  }
}
