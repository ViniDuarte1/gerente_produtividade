import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tasks extends StatefulWidget {
  final String nome;
  final DateTime hora1;
  final DateTime hora2;
  bool pomo;

  int level = 0;
  Tasks(this.nome, this.hora1, this.hora2, this.pomo, {Key? key})
      : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();

}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 229, 249, 254),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            height: 140,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[700],
                    ),
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.nome,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                            child: Text(
                              "${widget.hora1.hour}:${widget.hora1.minute}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            ),
                          ),
                          const Text(
                            " - ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20),
                          ),
                          Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                            child: Text(
                              "${widget.hora2.hour}:${widget.hora2.minute}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            ),
                          ),
                           AnimatedOpacity(
                            opacity: widget.pomo ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 1),
                            child: Text("era pra ter um pomodoro timer aqui"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
