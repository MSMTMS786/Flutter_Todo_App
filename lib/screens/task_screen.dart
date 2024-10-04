import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';
class TaskScreen extends StatelessWidget {
   const TaskScreen({super.key});

  Widget buildButtomSheet(BuildContext context)=> Container();

  Widget build(BuildContext context) {

    return Scaffold(
      
      // backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
        showModalBottomSheet(
        context:  context, 
        builder:(context)=> AddTaskSreen(),
        );
      },
      backgroundColor:  const Color(0Xff0a253a),
      child:const Icon(Icons.add,color: Color.fromARGB(213, 221, 206, 206),),),
      body:Stack( 
        children: [
            // Background Image
          Container(
            
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/im.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
           child:  Column( 

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.only(top: 60,left: 30,right: 30,bottom: 30),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                // ignore: sort_child_properties_last
                child:Icon(
                Icons.list,
                size: 30,color:Color(0Xff0a253a),
                ),
              backgroundColor: Colors.white,radius: 30,),
              const SizedBox(height: 10,),
              const Text("Todoey",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w700),),
              Text("${Provider.of<TaskData>(context).taskCount} Tasks",style: const TextStyle(color: Colors.white,fontSize: 18)),
              ],
          ),
          ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))
                  ),
              child: TasksList(),
              ),
            ),
            
            
            
        ],
      ),
          ),
        ],
      ),
      
    );
  }
}

