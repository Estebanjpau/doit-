import 'package:uuid/uuid.dart';

/// Entity class to represent a object task in the application.
/// As a abstraction, contains all the information needed to represent a task.
///
/// *[id]*: Unique identifier for the task.
/// *[title]*: Title of the task.
/// *[isCompleted]*: Indicates if the task is completed or not.
/// *[observations]*: Optional field to add any additional information about the task.
///
/// *observations is an value that not was use in the app for limit time, but it prepare for implementations*
class TaskEntity {
  final String id;
  final String title;
  final bool isCompleted;
  final String observations;

  TaskEntity({
    required this.id,
    required this.title,
    this.observations = '',
    this.isCompleted = false,
  });

  factory TaskEntity.createNew({required String title}) {
    return TaskEntity(
      id: const Uuid().v4(),
      title: title,
    );
  }

  TaskEntity copyWith({String? title, bool? isCompleted}) {
    return TaskEntity(
      id: id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}