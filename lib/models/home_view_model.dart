import 'dart:collection';

import 'package:dtodo/models/todo.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  //todolist
  List<Todo> todos = [];

  //get todoslist
  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos);

  //git todolistte completed ı true olan elemanları getir.
  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(todos.where((todo) => todo.completed));

  //git todolistte completed ı false olan elemanları getir.
  UnmodifiableListView<Todo> get unCompletedTodos =>
      UnmodifiableListView(todos.where((todo) => !todo.completed));

  //Add todo
  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    //find todo index
    int index = todos.indexOf(todo);

    //remove from index todo
    todos.removeAt(index);
    notifyListeners();
  }
}
