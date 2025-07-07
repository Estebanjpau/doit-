import 'package:doit/feature/task/presentation/viewmodels/task_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListState = ref.watch(taskListViewModelProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(taskListViewModelProvider.notifier).addTask("Nueva Tarea desde ViewModel");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}