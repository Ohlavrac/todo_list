import 'package:flutter/material.dart';
import 'package:todo_list/helper/database_helper.dart';
import 'package:todo_list/models/task.dart';
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
              child: Center(
                child: FutureBuilder<List<Task>>(
                  future: DatabaseHelper.instance.getTasks(),
                  builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: Text("Loading..."),);
                    }
                    return ListView(
                      children: snapshot.data!.map((tasks) {
                        return Center(
                          child: ListTile(
                            title: Text(tasks.title),
                            subtitle: Text(tasks.description),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
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