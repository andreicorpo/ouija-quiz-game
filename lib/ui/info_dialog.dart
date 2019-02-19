import 'package:flutter/material.dart';

class InfoDialog {
  final BuildContext _context;

  InfoDialog(this._context);

  showDialog() {
    return Theme(
      data: Theme.of(_context).copyWith(dialogBackgroundColor: Colors.black87),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 280.0,
          width: 300.0,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Easy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                      ),
                      Text(
                        'In easy mode you get between 25% - 50% of the letters automatically',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Normal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                      ),
                      Text(
                        'In normal mode you get the first and last letter throughout automatically',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hardcore',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                      ),
                      Text(
                        'In hardcore mode you don\'t get any letters',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(_context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
