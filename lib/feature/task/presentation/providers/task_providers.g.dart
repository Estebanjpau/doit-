// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'98a09c6cfd43966155dfbdb0787fa18c85438e13';

///DATABASE ↓↓↓
///Whe marked with keepAlive, to mantain the state in the lifecicle repository while the app is running.
///--> Is a powerfull tool, way like the design pattern singleton manage for riverpod.
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$tasksDaoHash() => r'667d89c958df7730f87a4894e5f4048a25640d4f';

/// See also [tasksDao].
@ProviderFor(tasksDao)
final tasksDaoProvider = AutoDisposeProvider<TasksDao>.internal(
  tasksDao,
  name: r'tasksDaoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tasksDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksDaoRef = AutoDisposeProviderRef<TasksDao>;
String _$taskLocalDataSourceHash() =>
    r'aaedf14e9271413ce07075aae0ad7a6414c91d29';

///REPOSITORIES/DATASOURCE ↓↓↓
///Providers for repository. Connect the bussiness logic with the data.
///-> Injection with riverpod helps to assure a low coupling between the bussiness logic and the data.
///
/// Copied from [taskLocalDataSource].
@ProviderFor(taskLocalDataSource)
final taskLocalDataSourceProvider =
    AutoDisposeProvider<TaskLocalDataSource>.internal(
      taskLocalDataSource,
      name: r'taskLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskLocalDataSourceRef = AutoDisposeProviderRef<TaskLocalDataSource>;
String _$taskRepositoryHash() => r'd2c2fcf4aafea4bc006fc5fbf8c4dc2d0115bcbc';

/// See also [taskRepository].
@ProviderFor(taskRepository)
final taskRepositoryProvider = AutoDisposeProvider<TaskRepository>.internal(
  taskRepository,
  name: r'taskRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskRepositoryRef = AutoDisposeProviderRef<TaskRepository>;
String _$getAllTasksUseCaseHash() =>
    r'c3a1fdafbe3eafb6811a4a245f2821a1434df71d';

/// USE CASES ↓↓↓
///Usecase dont require keepAlive annotations, to avoid reserves memory that can will be unnecesary.
///--> They are light instance and not have states
///
/// Copied from [getAllTasksUseCase].
@ProviderFor(getAllTasksUseCase)
final getAllTasksUseCaseProvider =
    AutoDisposeProvider<GetAllTasksUsecase>.internal(
      getAllTasksUseCase,
      name: r'getAllTasksUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getAllTasksUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllTasksUseCaseRef = AutoDisposeProviderRef<GetAllTasksUsecase>;
String _$addTaskUseCaseHash() => r'9fc891ccb8fd5ed75802cadd0eb3c63787c534d7';

/// See also [addTaskUseCase].
@ProviderFor(addTaskUseCase)
final addTaskUseCaseProvider = AutoDisposeProvider<AddTaskUsecase>.internal(
  addTaskUseCase,
  name: r'addTaskUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTaskUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddTaskUseCaseRef = AutoDisposeProviderRef<AddTaskUsecase>;
String _$updateTaskUseCaseHash() => r'5742b5b176fa260b1e6866a555e1ee9607c0fc6f';

/// See also [updateTaskUseCase].
@ProviderFor(updateTaskUseCase)
final updateTaskUseCaseProvider =
    AutoDisposeProvider<UpdateTaskUsecase>.internal(
      updateTaskUseCase,
      name: r'updateTaskUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateTaskUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateTaskUseCaseRef = AutoDisposeProviderRef<UpdateTaskUsecase>;
String _$deleteTaskUseCaseHash() => r'e70ba416bec4192b73ac6995cf42a0cefdc41c13';

/// See also [deleteTaskUseCase].
@ProviderFor(deleteTaskUseCase)
final deleteTaskUseCaseProvider =
    AutoDisposeProvider<DeleteTaskUsecase>.internal(
      deleteTaskUseCase,
      name: r'deleteTaskUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$deleteTaskUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeleteTaskUseCaseRef = AutoDisposeProviderRef<DeleteTaskUsecase>;
String _$tasksStreamHash() => r'f83fc199c69256d11cefd39b99b25218bcfadfda';

/// STREAMS ↓↓↓
/// UI providers for streams of data. This kind of providers make the app more responsive and reactive.
///
/// Copied from [tasksStream].
@ProviderFor(tasksStream)
final tasksStreamProvider =
    AutoDisposeStreamProvider<List<TaskEntity>>.internal(
      tasksStream,
      name: r'tasksStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$tasksStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TasksStreamRef = AutoDisposeStreamProviderRef<List<TaskEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
