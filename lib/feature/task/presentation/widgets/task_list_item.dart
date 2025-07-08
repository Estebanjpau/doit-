import 'package:doit/core/design_system/text_styles.dart';
import 'package:doit/core/types/types.dart';
import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/presentation/viewmodels/task_viewmodels.dart';
import 'package:doit/ui_base/alerts/confirmation_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListItem extends ConsumerWidget {
  final TaskEntity task;

  const TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) {
          ref.read(taskListViewModelProvider.notifier).toggleCompletion(task);
        },
      ),
      title: Text(
        task.title,
        style: task.isCompleted
            ? DesignSystem.textStyles.body.crossedOutSemibold(color: Colors.grey)
            : DesignSystem.textStyles.body.semibold(),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: Colors.blueGrey),
            onPressed: () {
              _showEditTaskDialog(context, ref, task);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => ConfirmationAlert(
                  type: StatusType.warning,
                  title: 'Confirmar',
                  content: '¿Estás seguro de que deseas eliminar esta tarea?',
                  confirmText: 'Eliminar',
                  onConfirm: () {
                    ref.read(taskListViewModelProvider.notifier).deleteTask(task.id);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showEditTaskDialog(BuildContext context, WidgetRef ref, TaskEntity task) {
    final controller = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Tarea', style: DesignSystem.textStyles.headings.h2()),
          content: TextField(
            controller: controller,
            style: DesignSystem.textStyles.body.regular(),
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Nuevo título de la tarea'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                final newTitle = controller.text;
                if (newTitle.isNotEmpty) {
                  final updatedTask = task.copyWith(title: newTitle);
                  ref.read(taskListViewModelProvider.notifier).updateTask(updatedTask);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

}
