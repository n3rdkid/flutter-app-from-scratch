import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_riverpod/controllers/quiz_state.dart';

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());
}
