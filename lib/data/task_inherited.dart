import 'package:flutter/material.dart';
import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tasks> taskList = [
    Tasks('Tarefa 1', DateTime.now(), DateTime.now(), false),
    Tasks('Tarefa 2', DateTime.now(), DateTime.now(), true),
  ];
  
  void newTask(String name, DateTime time1, DateTime time2, bool pomo) {
    taskList.add(Tasks(name, time1, time2, pomo));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}

