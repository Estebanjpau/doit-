import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_list_viewmodel.freezed.dart';
part 'task_list_viewmodel.g.dart';

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default([]) List<Task> tasks,
  }) = _TaskListState;
}

@riverpod
class TaskListViewModel extends _$TaskListViewModel {
  @override
  TaskListState build() {
    final tasksStream = ref.watch(getAllTasksUseCaseProvider).call();

    tasksStream.listen((tasks) {
      state = state.copyWith(isLoading: false, tasks: tasks);
    });

    return const TaskListState();
  }

  Future<void> addTask(String title) async {
    final addTaskUseCase = ref.read(addTaskUseCaseProvider);
    try {
      await addTaskUseCase(title);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    final updateTaskUseCase = ref.read(updateTaskUseCaseProvider);
    await updateTaskUseCase(task);
  }

  Future<void> deleteTask(String id) async {
    final deleteTaskUseCase = ref.read(deleteTaskUseCaseProvider);
    await deleteTaskUseCase(id);
  }

  Future<void> toggleCompletion(Task task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await updateTask(updatedTask);
  }
}