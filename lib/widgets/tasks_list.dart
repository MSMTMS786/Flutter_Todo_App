
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder:(context,taskData,child) {
        return ListView.builder(itemBuilder: (BuildContext context, int index) { 
          final task=taskData.tasks[index];
        return TaskTile(
         task.isDone,
         task.name,
         //checkboxXallBack
               (checkBoxState){
            taskData.updateTask(task);},
          //longpressCallBack              
               (){
            taskData.deleteTask(task);
          }
          );   
       },
       itemCount:taskData.taskCount,
      );
      },
    );
  }
}