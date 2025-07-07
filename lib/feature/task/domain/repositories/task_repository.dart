import 'package:doit/feature/task/domain/entities/task.dart';

abstract class TaskRepository {
  Stream<List<Task>> getAllTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}