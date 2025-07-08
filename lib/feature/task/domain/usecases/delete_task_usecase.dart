import 'package:doit/feature/task/domain/repositories/task_repository.dart';

///Delete method | Delete (D from -> CRUD)
class DeleteTaskUsecase {
  final TaskRepository repository;

  DeleteTaskUsecase(this.repository);

  Future<void> call(String id) {
    return repository.deleteTask(id);
  }
}