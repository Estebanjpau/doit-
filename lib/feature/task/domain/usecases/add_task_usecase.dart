import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';

///Create method | Create (C from -> CRUD)
class AddTaskUsecase {
  final TaskRepository repository;

  AddTaskUsecase(this.repository);

  Future<void> call(String title) {
    if (title.trim().isEmpty) {
      throw ArgumentError('El título no puede estar vacío.');
    }
    final newTask = TaskEntity.createNew(title: title);
    return repository.addTask(newTask);
  }
}