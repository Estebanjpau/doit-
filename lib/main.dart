import 'package:doit/feature/task/presentation/screens/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Entry point for the app.
void main() {
  /*
  Can use "WidgetsFlutterBinding.ensureInitialized()" if we need to call
  functions before the method 'runApp()' is called.
  like clients inicializations or plugins, or when we config orientations:
  SystemChrome.setPreferredOrientations().
  */

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: '¡Do it!',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const TaskListScreen(),
    );
  }
}
