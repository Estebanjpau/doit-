// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_viewmodels.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTasksHash() => r'29c384ebd4ca3979bb40395532825827a4b4e4f6';

/// See also [filteredTasks].
@ProviderFor(filteredTasks)
final filteredTasksProvider = AutoDisposeProvider<List<TaskEntity>>.internal(
  filteredTasks,
  name: r'filteredTasksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTasksRef = AutoDisposeProviderRef<List<TaskEntity>>;
String _$taskFilterNotifierHash() =>
    r'a792c613f2fb5d696efbf17b8eb2db8ff1208fc5';

/// See also [TaskFilterNotifier].
@ProviderFor(TaskFilterNotifier)
final taskFilterNotifierProvider =
    AutoDisposeNotifierProvider<TaskFilterNotifier, TaskFilter>.internal(
      TaskFilterNotifier.new,
      name: r'taskFilterNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskFilterNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaskFilterNotifier = AutoDisposeNotifier<TaskFilter>;
String _$taskListViewModelHash() => r'b632fdd412af703bd8c64a87f50ee499e7b60545';

///Viewmodel used to separate the logic from the UI
///It is used to manage the state of the UI
///Make unit tests easier to write and manage the state of the UI
///
/// Copied from [TaskListViewModel].
@ProviderFor(TaskListViewModel)
final taskListViewModelProvider =
    AutoDisposeNotifierProvider<TaskListViewModel, TaskListState>.internal(
      TaskListViewModel.new,
      name: r'taskListViewModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskListViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaskListViewModel = AutoDisposeNotifier<TaskListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
