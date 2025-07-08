import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';

///Update method | Update (U from -> CRUD)
class UpdateTaskUsecase {
  final TaskRepository repository;

  UpdateTaskUsecase(this.repository);

  Future<void> call(TaskEntity task) {
    if (task.title.trim().isEmpty) {
      throw ArgumentError('El título no puede estar vacío.');
    }
    return repository.updateTask(task);
  }
}