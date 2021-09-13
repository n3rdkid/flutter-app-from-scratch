import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_riverpod/controllers/quiz_state.dart';
import 'package:quiz_riverpod/models/question.dart';

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  void submitAnswer(Question currentQuestion, String answer) {
    if (state.getAnswered) {
      return;
    }
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
          selectedAnswer: answer,
          correct: state.correct..add(currentQuestion),
          status: QuizStatus.correct);
      return;
    }

    state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct..add(currentQuestion),
        status: QuizStatus.incorrect);
  }
}
