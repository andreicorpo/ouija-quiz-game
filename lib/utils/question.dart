class Question {
  final String _question;
  final String _answer;
  final String _questionUrl;

  String get question =>
      _question.replaceFirst(RegExp(r'_+'), '_' * _answer.length);
  String get answer => _answer;
  String get url => _questionUrl;

  Question(this._question, this._answer, this._questionUrl);
}
