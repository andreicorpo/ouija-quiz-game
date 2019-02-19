import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  const ModeButton({
    Key key,
    VoidCallback onPress,
    String text,
  })  : _text = text,
        _onPress = onPress,
        super(key: key);

  final VoidCallback _onPress;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        width: 100,
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: _onPress,
          child: Center(
            child: Text(
              _text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
