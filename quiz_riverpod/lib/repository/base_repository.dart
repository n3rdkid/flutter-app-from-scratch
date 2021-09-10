import 'package:quiz_riverpod/enums/difficulty.dart';
import 'package:quiz_riverpod/models/question.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required int categoryId,
    required Difficulty difficulty,
  });
}
