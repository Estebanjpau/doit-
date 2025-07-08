import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';

///Read method | Read (R from -> CRUD)
class GetAllTasksUsecase {
  final TaskRepository repository;

  GetAllTasksUsecase(this.repository);

  Stream<List<TaskEntity>> call() {
    return repository.watchAllTasks();
  }
}