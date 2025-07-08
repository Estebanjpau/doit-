import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/domain/repositories/task_repository.dart';
import 'package:doit/feature/task/domain/usecases/add_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/delete_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/get_all_task_usecase.dart';
import 'package:doit/feature/task/domain/usecases/update_task_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

/// Test class for the TaskRepository.
/// Unit testing for repository, setting up the test environment and
/// make sure of functionality of every use case
class FakeTaskRepository implements TaskRepository {
  final List<String> methodCalls = [];
  final List<TaskEntity> tasks = [];

  @override
  Future<void> addTask(TaskEntity task) async {
    methodCalls.add('addTask');
    tasks.add(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    methodCalls.add('deleteTask');
    tasks.removeWhere((task) => task.id == id);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    methodCalls.add('updateTask');
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    methodCalls.add('watchAllTasks');
    return Stream.value(tasks);
  }
}

void main() {
  group('Task Use Cases', () {
    late AddTaskUsecase addUsecase;
    late DeleteTaskUsecase deleteTaskUsecase;
    late UpdateTaskUsecase updateTaskUsecase;
    late GetAllTasksUsecase getAllTasksUsecase;
    late FakeTaskRepository fakeTaskRepository;

    setUp(() {
      fakeTaskRepository = FakeTaskRepository();
      addUsecase = AddTaskUsecase(fakeTaskRepository);
      deleteTaskUsecase = DeleteTaskUsecase(fakeTaskRepository);
      updateTaskUsecase = UpdateTaskUsecase(fakeTaskRepository);
      getAllTasksUsecase = GetAllTasksUsecase(fakeTaskRepository);
    });

    test('addUsecase should call addTask on the repository', () async {
      await addUsecase('Test a new task');
      expect(fakeTaskRepository.methodCalls, contains('addTask'));
    });

    test('addUsecase should throw an ArgumentError if title is empty', () {
      expect(() => addUsecase(''), throwsA(isA<ArgumentError>()));
      expect(fakeTaskRepository.methodCalls.contains('addTask'), isFalse);
    });

    test('updateUsecase should call updateTask on the repository', () async {
      final taskToUpdate = TaskEntity(id: 'uuid1', title: 'Edit task');
      await updateTaskUsecase(taskToUpdate);
      expect(fakeTaskRepository.methodCalls, contains('updateTask'));
    });

    test('deleteUsecase should call deleteTask on the repository', () async {
      await deleteTaskUsecase('uuid1');
      expect(fakeTaskRepository.methodCalls, contains('deleteTask'));
    });

    test('getAllTasksUsecase should call watchAllTasks on the repository', () {
      getAllTasksUsecase();
      expect(fakeTaskRepository.methodCalls, contains('watchAllTasks'));
    });
  });
}
