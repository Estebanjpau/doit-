import 'package:doit/feature/task/domain/entities/task.dart';
import 'package:doit/feature/task/presentation/widgets/task_list_item.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<TaskEntity> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    /// ListView for lazy loading of items, improving performance
    /// separated for add a divider between items
    return ListView.separated(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskListItem(task: task);
      },
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: Divider(height: 1)),
    );
  }
}
