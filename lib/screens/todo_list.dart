import 'package:flutter/material.dart';
import 'package:todo_list/helper/database_helper.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/shared/theme/app_colors.dart';
import 'package:todo_list/shared/theme/text_styles.dart';

class TodoList extends StatefulWidget {
  const TodoList({ Key? key }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isChecked = false;

  bool _value(int? value) {
    if (value == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text("To-Do List", style: TextStyles.barText,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              
            });
          }, icon: Icon(Icons.refresh))
        ],
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
                      return Center(child: Text("Loading...", style: TextStyles.subtitle,),);
                    }
                    return ListView(
                      children: snapshot.data!.map((tasks) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: AppColors.secondary,
                              child: ListTile(
                                leading: Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: AppColors.checkboxOk,
                                    tristate: true,
                                    value: _value(tasks.isComplete),
                                    onChanged: (bool? value) async {
                                      await DatabaseHelper.instance.completeTask(tasks);
                                      setState(() {
                                        print(tasks.toMap());                             
                                      });
                                    },
                                  ),
                                ),
                                title: Text(tasks.title, style: TextStyles.title,),
                                subtitle: Text(tasks.description, style: TextStyles.subtitle2, maxLines: 2, overflow: TextOverflow.ellipsis,),
                                isThreeLine: true,
                                trailing: IconButton(
                                  onPressed: () async {
                                    await DatabaseHelper.instance.deleteTask(tasks);
                                    setState(() {
                                      
                                    });
                                  },
                                  icon: Icon(Icons.delete, size: 35, color: AppColors.trash,),
                                ),
                              ),
                            ),
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
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.pushNamed(context, "/create_todo");
        },
        child: Icon(Icons.add, color: AppColors.background,),
      ),
    );
  }
}