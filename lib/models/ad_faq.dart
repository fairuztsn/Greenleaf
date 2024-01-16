import 'package:equatable/equatable.dart';

class FAQ extends Equatable {
  final String? question;
  final String? answer;
  final String? subquestion;
  final int? role;
  const FAQ({this.question, this.answer, this.role, this.subquestion});

  FAQ copyWith(
      {String? question, String? answer, int? role, String? subquestion}) {
    return FAQ(
        answer: answer ?? this.answer,
        question: question ?? this.question,
        role: role ?? this.role,
        subquestion: subquestion ?? this.subquestion);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
      'subquestion': subquestion,
      'role_id': role
    };
  }

  factory FAQ.fromMap(Map<String, dynamic> map) {
    return FAQ(
        answer: map['answer'],
        question: map['question'],
        role: map['role_id'],
        subquestion: map['subquestion']);
  }

  @override
  List<Object?> get props => [question, answer, subquestion, role];
}
