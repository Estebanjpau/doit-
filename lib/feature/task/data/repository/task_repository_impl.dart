import 'package:doit/feature/task/data/datasources/local/task_local_datasource_impl.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTask(TaskEntity task) {
    return localDataSource.addTask(task);
  }

  @override
  Future<void> updateTask(TaskEntity task) {
    return localDataSource.updateTask(task);
  }

  @override
  Future<void> deleteTask(String id) {
    return localDataSource.deleteTask(id);
  }

  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    return localDataSource.watchAllTasks();
  }
}