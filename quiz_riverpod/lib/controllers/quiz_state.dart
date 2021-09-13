import 'package:equatable/equatable.dart';
import 'package:quiz_riverpod/models/question.dart';

enum QuizStatus { initial, correct, incorrect, complete }

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<Question> correct;
  final List<Question> incorrect;
  final QuizStatus status;

  factory QuizState.initial() {
    return QuizState(
        selectedAnswer: '',
        correct: [],
        incorrect: [],
        status: QuizStatus.initial);
  }
  QuizState({
    required this.selectedAnswer,
    required this.correct,
    required this.incorrect,
    required this.status,
  });

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  bool get getAnswered =>
      status == QuizStatus.incorrect || status == QuizStatus.correct;

  QuizState copyWith({
    String? selectedAnswer,
    List<Question>? correct,
    List<Question>? incorrect,
    QuizStatus? status,
  }) {
    return QuizState(
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        correct: correct ?? this.correct,
        incorrect: incorrect ?? this.incorrect,
        status: status ?? this.status);
  }
}
