import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:collection';

import 'package:todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  TaskData() {
    // Load tasks from shared preferences during initialization
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskNames = prefs.getStringList('tasks') ?? [];

    _tasks = taskNames.map((taskName) => Task(taskName, false)).toList();
    notifyListeners();
  }

  void _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskNames = _tasks.map((task) => task.name).toList();
    prefs.setStringList('tasks', taskNames);
  }

  void addTask(String newTaskTitle) {
    final task = Task(newTaskTitle, false);
    _tasks.add(task);
    _saveTasks(); // Save tasks to shared preferences when adding
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    _saveTasks(); // Save tasks to shared preferences when updating
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _saveTasks(); // Save tasks to shared preferences when deleting
    notifyListeners();
  }
}
