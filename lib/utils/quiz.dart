import 'package:ouija_quiz_game/utils/models/reddit.dart';
import 'package:ouija_quiz_game/utils/question.dart';

class Quiz {
  List<Question> _questions = [];
  List<Post> _posts = [];
  List<String> _answers = [];
  int _currentQuestion = -1;
  int _score = 0;

  Quiz(this._posts) {
    _posts.forEach((post) {
      if (post.link_flair_text != null) {
        String response = post.link_flair_text.replaceAll('Ouija says: ', '');
        if (response.contains(RegExp('[0-9a-bA-Z]+')) &&
            !post.title.contains('Please read the rules')) {
          _questions.add(Question(post.title, response, post.url));
          _answers.add(response);
        }
      }
    });
  }

  List<Question> get questions => _questions;
  List<String> get answers => _answers;
  int get length => _questions.length;
  int get questionNumber => _currentQuestion + 1;
  int get score => _score;

  Question get nextQuestion {
    _currentQuestion++;
    if (_currentQuestion >= length) {
      print('Out of questions');
      return null;
    }
    return _questions[_currentQuestion];
  }

  void answer(bool isCorrect) {
    if (isCorrect) {
      _score++;
    }
  }
}
