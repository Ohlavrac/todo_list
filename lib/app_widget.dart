import 'package:flutter/material.dart';
import 'package:todo_list/screens/create_todo.dart';

import 'screens/todo_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do List",
      debugShowCheckedModeBanner: false,
      initialRoute: "/todo_list",
      routes: {
        "/todo_list": (context) => TodoList(),
        "/create_todo": (context) => CreateTodo(),
      },
    );
  }
}