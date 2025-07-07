import 'package:doit/feature/task/data/repository/task_repository_impl.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';
import 'package:doit/feature/task/domain/usecases/add_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/delete_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/get_all_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/update_task_use_case.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/local/app_database.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) => AppDatabase();

@riverpod
TasksDao tasksDao(Ref ref) => ref.watch(appDatabaseProvider).tasksDao;

@riverpod
TaskRepository taskLocalDataSource(Ref ref) {
  return TaskRepositoryImpl(ref.watch(tasksDaoProvider));
}

@riverpod
TaskRepository taskRepository(Ref ref) {
  return TaskRepositoryImpl(localDataSource: ref.watch(taskDataSourceProvider));
}

@riverpod
GetAllTasksUsecase getAllTasksUseCase(Ref ref) {
  return GetAllTasksUsecase(ref.watch(taskRepositoryProvider));
}

@riverpod
AddTaskUsecase addTaskUseCase(Ref ref) {
  return AddTaskUsecase(ref.watch(taskRepositoryProvider));
}

@riverpod
UpdateTaskUsecase updateTaskUseCase(Ref ref) {
  return UpdateTaskUsecase(ref.watch(taskRepositoryProvider));
}

@riverpod
DeleteTaskUsecase deleteTaskUseCase(Ref ref) {
  return DeleteTaskUsecase(ref.watch(taskRepositoryProvider));
}