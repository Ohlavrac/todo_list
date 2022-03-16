import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme/components/input_text.dart';
import 'package:todo_list/shared/theme/text_styles.dart';

import '../shared/theme/components/input_text_multline.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({ Key? key }) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  late String _title;
  late String _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New task", style: TextStyles.barText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Create a new task", style: TextStyles.simpleText),
              InputText(label: "Title", onChanged: (value) {
                _title = value;
              }),
              InputTextMultline(label: "Description", onChanged: (value) {
                _description = value;
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_title + _description);
          //Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}