import 'package:doit/core/types/types.dart';
import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/presentation/viewmodels/task_viewmodels.dart';
import 'package:doit/feature/task/presentation/widgets/task_list.dart';
import 'package:doit/ui_base/notifications/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:doit/core/design_system/text_styles.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// listen the states changes for the viewmodel for show notifications
    ref.listen(taskListViewModelProvider, (previous, next) {
      if (next.errorMessage != null) {
        CustomSnackbar.show(context: context, message: next.errorMessage!, type: StatusType.error);
      }

      if (previous != null && previous.tasks.length < next.tasks.length) {
        CustomSnackbar.show(context: context, message: "Tarea creada con éxito", type: StatusType.success);
      }

      if (previous != null && previous.tasks.length > next.tasks.length) {
        CustomSnackbar.show(context: context, message: "Tarea eliminada con éxito", type: StatusType.info);
      }
    });
    final taskListState = ref.watch(taskListViewModelProvider);
    final currentFilter = ref.watch(taskFilterNotifierProvider);
    final filteredTasks = ref.watch(filteredTasksProvider);

    return Scaffold(
      appBar: AppBar(
        /// Import from design system make easier build and maintain UI for developers
        /// and make it more exact from the prototype
        title: Text('Mis Tareas', style: DesignSystem.textStyles.headings.h1()),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SegmentedButton<TaskFilter>(
              segments: <ButtonSegment<TaskFilter>>[
                ButtonSegment(
                  value: TaskFilter.all,
                  label: Text('Todas', style: DesignSystem.textStyles.body.regular()),
                ),
                ButtonSegment(
                  value: TaskFilter.active,
                  label: Text('Por Hacer', style: DesignSystem.textStyles.body.regular()),
                ),
                ButtonSegment(
                  value: TaskFilter.completed,
                  label: Text('Listas', style: DesignSystem.textStyles.body.regular()),
                ),
              ],
              selected: {currentFilter},
              onSelectionChanged: (newSelection) {
                ref.read(taskFilterNotifierProvider.notifier).setFilter(newSelection.first);
              },
            ),
          ),
          Expanded(child: Center(child: _buildBody(context, taskListState, filteredTasks))),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// function to build the body of the screen
  Widget _buildBody(BuildContext context, TaskListState state, List<TaskEntity> filteredTasks) {
    if (state.isLoading && state.tasks.isEmpty) {
      return const CircularProgressIndicator();
    }
    if (state.errorMessage != null) {
      return Text('Error: ${state.errorMessage}');
    }
    if (state.tasks.isEmpty) {
      return Text('¡No hay tareas! Añade una nueva.', style: DesignSystem.textStyles.body.regular());
    }

    return TaskList(tasks: filteredTasks);
  }

  /// extract logic to show a dialog to add a new task
  /// and call the viewmodel to add the task
  /// modularize view and logic for better maintainability
  void _showAddTaskDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Nueva Tarea', style: DesignSystem.textStyles.headings.h2()),
          content: TextField(
            controller: controller,
            style: DesignSystem.textStyles.body.regular(),
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Describe tu tarea'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
            FilledButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  ref.read(taskListViewModelProvider.notifier).addTask(controller.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}
