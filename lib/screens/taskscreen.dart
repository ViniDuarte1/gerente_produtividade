
import 'package:app/data/tasks_inherited.dart';
import 'package:flutter/material.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        title: const Text(
          'Gerente Produção',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.small(
              backgroundColor: Colors.blue,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ],  
      ),

      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children:  TaskInherited.of(context).taskList,
      ),
    );
  }
}
