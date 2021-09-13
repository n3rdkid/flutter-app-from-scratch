import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_riverpod/controllers/quiz_state.dart';
import 'package:quiz_riverpod/models/question.dart';

final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizState>((ref) => QuizController());

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

  void nextQuestion(List<Question> questions, int currentIdx) {
    state = state.copyWith(
        selectedAnswer: '',
        status: currentIdx + 1 < questions.length
            ? QuizStatus.initial
            : QuizStatus.complete);
  }

  void reset() {
    state = QuizState.initial();
  }
}
