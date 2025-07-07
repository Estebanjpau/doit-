import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final String observations;

  Task({
    required this.id,
    required this.title,
    this.observations = '',
    this.isCompleted = false,
  });

  factory Task.createNew({required String title}) {
    return Task(
      id: const Uuid().v4(),
      title: title,
    );
  }

  Task copyWith({String? title, bool? isCompleted}) {
    return Task(
      id: id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}