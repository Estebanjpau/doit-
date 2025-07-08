import 'package:doit/feature/task/domain/entities/task.dart';

/// Defines the contract for the TaskRepository.
/// This abstraction allows for decoupled architecture
/// and respects the Dependency Inversion Principle.
abstract class TaskRepository {
  Stream<List<TaskEntity>> watchAllTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}