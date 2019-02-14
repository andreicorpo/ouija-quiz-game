import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
