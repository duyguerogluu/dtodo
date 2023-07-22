import 'dart:collection';
import 'dart:convert';
import 'package:dtodo/models/todo.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  var todos = <Todo>[];

  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos);
  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(todos.where((todo) => todo.completed));
  UnmodifiableListView<Todo> get unCompletedTodos =>
      UnmodifiableListView(todos.where((todo) => !todo.completed));

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
    saveDataToLocalStorage();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    print('Removed!');
    notifyListeners();
    updateDataToLocalStorage();
  }

  void toggleTodo(Todo todo) {
    var index = todos.indexOf(
        todo); //kullanıcının bana verdiği todonun indexini todos listesinde bulup index değişkenine atıyo
    print('Completed');
    todos[index].completedTodo(); // dokunduğumuzun tamamlanmasını değiştircek
    notifyListeners();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadDataToLocalStorage();
    notifyListeners();
  }

  //SAVEDATA - SharedPreferences
  void saveDataToLocalStorage() {
    List<String>? spList =
        todos.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('list', spList);
  }

  //load data - SharedPreferences
  void loadDataToLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    todos = spList!.map((item) => Todo.fromMap(json.decode(item))).toList();
  }

  //update data - SharedPreferences
  void updateDataToLocalStorage() {
    sharedPreferences!.remove('list');
    List<String>? spList =
        todos.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('list', spList);
  }
}
