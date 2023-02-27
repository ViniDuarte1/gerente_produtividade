import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import '../data/task_inherited.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
    required this.taskContext,
  });

  final BuildContext taskContext;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();

}



class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController nameController = TextEditingController();
  DateTime hour1Controller = DateTime.now();
  DateTime hour2Controller = DateTime.now();

  bool checkValue = false;

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Screen'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Digite seu nome',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DateTimeFormField(
                      use24hFormat: true,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Start time',
                      ),
                      mode: DateTimeFieldPickerMode.time,
                      // autovalidateMode: AutovalidateMode.always,
                      // validator: (e) => (e?.day ?? 0) == 1
                      //     ? 'Please not the first day'
                      //     : null,
                      onDateSelected: (DateTime value) {
                        setState(
                          () {
                            hour1Controller = value;
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DateTimeFormField(
                      use24hFormat: true,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'End time',
                      ),
                      mode: DateTimeFieldPickerMode.time,
                      // autovalidateMode: AutovalidateMode.always,
                      // validator: (e) => (e?.day ?? 0) == 1
                      //     ? 'Please not the first day'
                      //     : null,
                      onDateSelected: (DateTime value) {
                        setState(
                          () {
                            hour2Controller = value;
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CheckboxListTile(
                      value: checkValue,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: const Text("Adcionar pomodoro timer a tarefa"),
                      onChanged: (value) {
                        setState(
                          () {
                            checkValue = value!;
                          },
                        );
                        
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print(nameController.text);
                        // print(int.parse(difficultyController.text));
                        // print(imageController.text);
                        TaskInherited.of(widget.taskContext).newTask(
                          nameController.text,
                          hour1Controller,
                          hour2Controller,
                          checkValue,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tarefa adicionada com sucesso!'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('ADD TASK'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
