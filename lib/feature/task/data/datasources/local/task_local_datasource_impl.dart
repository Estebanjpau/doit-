// feature/task/data/datasources/local/task_local_datasource_impl.dart

import 'package:doit/core/data/database/app_database.dart' as db;
import 'package:doit/feature/task/domain/entities/task.dart';
import 'i_task_local_datasource.dart';

class TaskLocalDataSourceImpl implements ITaskLocalDataSource {
  final db.TasksDao _tasksDao;

  TaskLocalDataSourceImpl(this._tasksDao);

  @override
  Stream<List<Task>> watchAllTasks() {
    return _tasksDao.watchAllTasks().map((dbTasks) {
      // Mapea del modelo de Drift a la entidad del Dominio
      return dbTasks.map((dbTask) => Task(
        id: dbTask.id,
        title: dbTask.title,
        isCompleted: dbTask.isCompleted,
      )).toList();
    });
  }

  @override
  Future<void> addTask(Task task) {
    // Mapea de la entidad del Dominio al modelo de Drift
    final dbTask = db.Task(id: task.id, title: task.title, isCompleted: task.isCompleted);
    return _tasksDao.insertTask(dbTask);
  }

  @override
  Future<void> updateTask(Task task) {
    final dbTask = db.Task(id: task.id, title: task.title, isCompleted: task.isCompleted);
    return _tasksDao.updateTask(dbTask);
  }

  @override
  Future<void> deleteTask(String id) {
    return _tasksDao.deleteTask(id);
  }
}