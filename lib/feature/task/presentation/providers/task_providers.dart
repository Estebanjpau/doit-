import 'package:doit/core/database/app_database.dart';
import 'package:doit/feature/task/data/datasources/local/task_local_datasource_impl.dart';
import 'package:doit/feature/task/data/repository/task_repository_impl.dart';
import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';
import 'package:doit/feature/task/domain/usecases/add_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/delete_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/get_all_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/update_task_use_case.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_providers.g.dart';

//DATABASE ↓↓↓
//Whe marked with keepAlive, to mantain the state in the lifecicle repository while the app is running.
//--> Is a powerfull tool, way like the design pattern singleton manage for riverpod.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) => AppDatabase();

@riverpod
TasksDao tasksDao(Ref ref) => ref.watch(appDatabaseProvider).tasksDao;


//REPOSITORIES/DATASOURCE ↓↓↓
//Providers for repository. Connect the bussiness logic with the data.
//-> Injection with riverpod helps to assure a low coupling between the bussiness logic and the data.
@riverpod
TaskLocalDataSource taskLocalDataSource(Ref ref) {
  return TaskLocalDataSourceImpl(ref.watch(tasksDaoProvider));
}

@riverpod
TaskRepository taskRepository(Ref ref) {
  return TaskRepositoryImpl(
      localDataSource: ref.watch(taskLocalDataSourceProvider));
}


// USE CASES ↓↓↓
//Usecase dont require keepAlive annotations, to avoid reserves memory that can will be unnecesary.
//--> They are light instance and not have states
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

// STREAMS ↓↓↓
// UI providers for streams of data. This kind of providers make the app more responsive and reactive.
@riverpod
Stream<List<TaskEntity>> tasksStream(Ref ref) {
  return ref.watch(getAllTasksUseCaseProvider).call();
}