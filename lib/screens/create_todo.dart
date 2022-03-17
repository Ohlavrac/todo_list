import 'package:flutter/material.dart';
import 'package:todo_list/controllers/validators.dart';
import 'package:todo_list/helper/database_helper.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/shared/components/input_text.dart';
import 'package:todo_list/shared/theme/text_styles.dart';

import '../shared/components/input_text_multline.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({ Key? key }) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  late GlobalKey<FormState> _key = new GlobalKey();
  String _title = "";
  String _description = "";
  bool validate = false;
  final validator = Validators();

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
          child: Form(
            key: _key,
            child: Column(
              children: [
                Text("Create a new task", style: TextStyles.simpleText),
                InputText(validator: (_) => validator.validateTitle(_title), label: "Title", onChanged: (value) {
                  _title = value;
                }),
                InputTextMultline(validator: (_) => validator.validateDescription(_description) ,label: "Description", onChanged: (value) {
                  _description = value;
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_key.currentState!.validate()) {
            _key.currentState!.save();
          } else {
            setState(() {
              validate = true;
            });
          }

          if (_title.isEmpty || _description.isEmpty) {
            print("Preencher os campos acima");
          } else {
            print("Titulo: ${_title} | Descrição: ${_description}");
            await DatabaseHelper.instance.addTask(
              Task(title: _title, description: _description)
            );
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}