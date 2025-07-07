import 'package:doit/feature/task/domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRepository localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTask(Task task) {
    return localDataSource.addTask(task);
  }

  @override
  Future<void> updateTask(Task task) {
    return localDataSource.updateTask(task);
  }

  @override
  Future<void> deleteTask(String id) {
    return localDataSource.deleteTask(id);
  }

  @override
  Stream<List<Task>> getAllTasks() {
    return localDataSource.getAllTasks();
  }
}