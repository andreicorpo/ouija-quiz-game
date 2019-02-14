import 'package:flutter/material.dart';

String _keyboardKey = '';

String get keyboardKey => _keyboardKey;

class AnswerKeyboard extends StatelessWidget {
  final VoidCallback _onTap;

  AnswerKeyboard(this._onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 16.0)),
          Wrap(
            alignment: WrapAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
                .map((digit) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.5),
                    child: KeyButton(
                      textSize: 23,
                      letter: digit,
                      onTap: _onTap,
                    ).build(context)))
                .toList(),
          ),
          KeyboardRow(
            letters: [
              'A',
              'B',
              'C',
              'D',
              'E',
              'F',
              'G',
              'H',
              'I',
              'J',
              'K',
              'L',
              'M',
              'N',
              'O',
              'P',
              'Q',
              'R',
              'S',
              'T',
              'U',
              'V',
              'W',
              'X',
              'Y',
              'Z'
            ],
            onTap: _onTap,
            textSize: 27.0,
          ),
          Padding(padding: EdgeInsets.only(bottom: 16.0)),
        ],
      ),
    );
  }
}

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({
    Key key,
    @required List<String> letters,
    @required onTap,
    @required textSize,
  })  : _letters = letters,
        _onTap = onTap,
        _textSize = textSize,
        super(key: key);

  final List<String> _letters;
  final VoidCallback _onTap;
  final double _textSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: _buildRow(_letters, _onTap, _textSize),
    );
  }

  List<Widget> _buildRow(
      List<String> letters, VoidCallback onTap, double textSize) {
    List<Widget> result = [];
    for (var letter in letters) {
      result.add(Padding(padding: EdgeInsets.only(left: 4.0)));
      result.add(KeyButton(
        letter: letter,
        onTap: onTap,
        textSize: textSize,
      ));
      result.add(Padding(padding: EdgeInsets.only(left: 4.0)));
    }
    return result;
  }
}

class KeyButton extends StatelessWidget {
  const KeyButton({
    Key key,
    @required String letter,
    @required onTap,
    @required double textSize,
  })  : _letter = letter,
        _onTap = onTap,
        _textSize = textSize,
        super(key: key);

  final String _letter;
  final VoidCallback _onTap;
  final double _textSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.blueAccent,
        highlightColor: Colors.blueAccent,
        customBorder: CircleBorder(),
        onTap: () {
          _keyboardKey = this._letter;
          _onTap();
        },
        child: Container(
          width: 30.0,
          height: 40.0,
          child: Center(
            child: Text(
              _letter,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: _textSize,
                  shadows: [
                    Shadow(offset: Offset(1.0, 1.0), color: Colors.black12)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
