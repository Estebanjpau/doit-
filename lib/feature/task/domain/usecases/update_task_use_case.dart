import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';

///Update method | CR(Update)D

class UpdateTaskUsecase {
  final TaskRepository repository;

  UpdateTaskUsecase(this.repository);

  Future<void> call(Task task) {
    if (task.title.trim().isEmpty) {
      throw ArgumentError('El título no puede estar vacío.');
    }
    return repository.updateTask(task);
  }
}