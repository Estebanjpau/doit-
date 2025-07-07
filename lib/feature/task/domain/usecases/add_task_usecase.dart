import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';

///Create method | (Create)RUD

class AddTaskUsecase {
  final TaskRepository repository;

  AddTaskUsecase(this.repository);

  Future<void> call(String title) {
    if (title.trim().isEmpty) {
      throw ArgumentError('El título no puede estar vacío.');
    }
    final newTask = Task.createNew(title: title);
    return repository.addTask(newTask);
  }
}