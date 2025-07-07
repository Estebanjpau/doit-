import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';

///Read method | C(Read)UD

class GetAllTasksUsecase {
  final TaskRepository repository;

  GetAllTasksUsecase(this.repository);

  Stream<List<Task>> call() {
    return repository.getAllTasks();
  }
}