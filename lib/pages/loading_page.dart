import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoadingPage extends StatelessWidget {
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
        child: Center(
          child: FlareActor(
            'assets/OuijaLoadingPage.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: 'Loading',
          ),
        ),
      ),
    );
  }
}
