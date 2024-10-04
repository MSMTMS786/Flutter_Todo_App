
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

 final bool isChecked;
 final String taskTitle;
 final void Function(bool?) checkBoxCallBack;
  final Function()? longpressCallBack;
  TaskTile(this.isChecked,this.taskTitle,this.checkBoxCallBack ,this.longpressCallBack);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longpressCallBack,
      title: Text(
        taskTitle,
      style: TextStyle(decoration: isChecked? TextDecoration.lineThrough :null) ,),
      trailing: Checkbox(
      activeColor:Color(0Xff0a253a),
      value: isChecked, 
      onChanged:checkBoxCallBack,
      ),
    );
  }
}

