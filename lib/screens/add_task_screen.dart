import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final taskInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String newTask;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.greenAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: taskInputController,
              onChanged: (value) {
                newTask = value;
              },
            ),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskInputController.text);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }
}
