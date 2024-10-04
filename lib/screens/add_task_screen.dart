
import 'package:flutter/material.dart';
// import 'package:todoey/model/task.dart';
import 'package:provider/provider.dart';
// import 'package:todoey/model/task.dart';
import 'package:todoey/model/task_data.dart';

class AddTaskSreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   var _newTaskTitle;
    return Container(
    color: const Color(0xff757575),
    child: Container(  
              padding: const EdgeInsets.only(left: 60,right: 60,),
                  decoration: const BoxDecoration
                  (
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(30),topRight:Radius.circular(30),
                      ),
                       ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  
                  children: [
                  
                  // const Center(
                  //   child: Text("Add Task",
                  //   style: TextStyle(color: Color(0Xff0a253a),fontSize: 32,),),
                  // ),
                  
               TextField(
                    decoration: const InputDecoration(
                      hintText: "Your Task . .",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 15, 106, 175),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4.5,
                      fontStyle: FontStyle.italic,fontFamily: "cursive")
                    ),
                    
                    autofocus: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                 onChanged: (newText) {
                   
                   _newTaskTitle=newText;
                   print(_newTaskTitle);
                 },
                  ),
                  const SizedBox(height: 5,),
                  
                   Container(
                padding: const EdgeInsets.only(left: 40,right: 40,),
                     child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0Xff0a253a),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),
                        onPressed: (){
                          Provider.of<TaskData>(context,listen: false).addTask(_newTaskTitle);
                          Navigator.pop(context);
                          
                        
                        },
                         child: const Text("ADD TASK",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                           fontStyle: FontStyle.italic,fontFamily: "cursive"
                         ),),),
                   ),

                  
                ],),
                  ),
    );
  }
}