import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme/text_styles.dart';

class TodoList extends StatefulWidget {
  const TodoList({ Key? key }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List", style: TextStyles.barText,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: Text("My Tasks", style: TextStyles.subtitle,),
            ),
            Expanded(
              child: ListView(
                
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/create_todo");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}