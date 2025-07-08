import 'package:doit/core/types/types.dart';
import 'package:doit/core/utils/handlers/action_executor.dart';
import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/presentation/providers/task_providers.dart';
import 'package:doit/feature/task/presentation/screens/task_list_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_viewmodels.freezed.dart';

part 'task_viewmodels.g.dart';

/// Represents the state of the task list UI, managed by [TaskListViewModel].
/// Uses Freezed for immutable state objects and helper methods.
@freezed
abstract class TaskListState with _$TaskListState {
  const factory TaskListState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default([]) List<TaskEntity> tasks,
  }) = _TaskListState;
}

/// Manage filters for tasks, managed by [TaskFilterNotifier].
/// Using riverpod and the states management pattern, this class
/// is use to paint the UI with the correct filter in [TaskListScreen] reactively.
@riverpod
class TaskFilterNotifier extends _$TaskFilterNotifier {
  @override
  TaskFilter build() {
    return TaskFilter.all;
  }

  void setFilter(TaskFilter newFilter) {
    state = newFilter;
  }
}

@riverpod
List<TaskEntity> filteredTasks(Ref ref) {
  final filter = ref.watch(taskFilterNotifierProvider);
  final tasks = ref.watch(taskListViewModelProvider).tasks;

  switch (filter) {
    case TaskFilter.completed:
      return tasks.where((task) => task.isCompleted).toList();
    case TaskFilter.active:
      return tasks.where((task) => !task.isCompleted).toList();
    case TaskFilter.all:
      return tasks;
  }
}

///Viewmodel used to separate the logic from the UI
///It is used to manage the state of the UI,
///
///*Make unit tests easier to write and manage the state of the UI*
@riverpod
class TaskListViewModel extends _$TaskListViewModel {
  @override
  TaskListState build() {
    final tasksStream = ref.watch(getAllTasksUseCaseProvider).call();
    final tasksValue = ref.watch(tasksStreamProvider);

    tasksStream.listen((tasks) {
      state = state.copyWith(isLoading: false, tasks: tasks);
    });

    return tasksValue.when(
      data: (tasks) => TaskListState(isLoading: false, tasks: tasks),
      loading: () => const TaskListState(isLoading: true),
      error: (err, stack) => TaskListState(isLoading: false, errorMessage: err.toString()),
    );
  }

  // try catch to handle errors using the helper function
  // if there is an error, the state will be updated with the error message aproved by the usecase
  Future<void> addTask(String title) async {
    await executeAction(
      action: () => ref.read(addTaskUseCaseProvider).call(title),
      onError: (e, s) => state = state.copyWith(errorMessage: e.toString()),
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    await executeAction(
      action: () => ref.read(updateTaskUseCaseProvider).call(task),
      onError: (e, s) => state = state.copyWith(errorMessage: e.toString()),
    );
  }

  Future<void> deleteTask(String id) async {
    await executeAction(
      action: () => ref.read(deleteTaskUseCaseProvider).call(id),
      onError: (e, s) => state = state.copyWith(errorMessage: e.toString()),
    );
  }

  Future<void> toggleCompletion(TaskEntity task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await updateTask(updatedTask);
  }
}
