class AnsweredQuestion {
  final String _question;
  final String _answer;
  final String _userAnswer;
  final bool _wasCorrect;
  final String _questionURL;

  String get question => _question;
  String get answer => _answer;
  String get userAnswer => _userAnswer;
  bool get wasCorrect => _wasCorrect;
  String get questionURL => _questionURL;

  AnsweredQuestion(this._question, this._answer, this._userAnswer,
      this._wasCorrect, this._questionURL);
}
