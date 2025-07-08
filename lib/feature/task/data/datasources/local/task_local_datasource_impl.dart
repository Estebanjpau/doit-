// feature/task/data/datasources/local/task_local_datasource_impl.dart

import 'package:doit/core/database/app_database.dart' as db;
import 'package:doit/feature/task/domain/entities/task.dart';

abstract class TaskLocalDataSource {
  Stream<List<TaskEntity>> watchAllTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final db.TasksDao _tasksDao;

  TaskLocalDataSourceImpl(this._tasksDao);

  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    return _tasksDao.watchAllTasks().map((dbTasks) {
      return dbTasks.map((dbTask) => TaskEntity(
        id: dbTask.id,
        title: dbTask.title,
        isCompleted: dbTask.isCompleted,
      )).toList();
    });
  }

  @override
  Future<void> addTask(TaskEntity task) {
    final dbTask = db.Task(id: task.id, title: task.title, isCompleted: task.isCompleted);
    return _tasksDao.insertTask(dbTask);
  }

  @override
  Future<void> updateTask(TaskEntity task) {
    final dbTask = db.Task(id: task.id, title: task.title, isCompleted: task.isCompleted);
    return _tasksDao.updateTask(dbTask);
  }

  @override
  Future<void> deleteTask(String id) {
    return _tasksDao.deleteTask(id);
  }
}