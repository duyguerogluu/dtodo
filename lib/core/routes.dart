import 'dart:collection';
import 'package:dtodo/models/todo.dart';
import 'package:dtodo/screens/detail_screens.dart';
import 'package:dtodo/screens/home_view.dart';
import 'package:dtodo/widgets/todo_list.dart';
import 'package:go_router/go_router.dart';

late final Todo todo;
var todos = <Todo>[];
UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos);
UnmodifiableListView<Todo> get completedTodos =>
    UnmodifiableListView(todos.where((todo) => todo.completed));
UnmodifiableListView<Todo> get unCompletedTodos =>
    UnmodifiableListView(todos.where((todo) => !todo.completed));

abstract class Routes {
  static List<RouteBase> routes = [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: "/detailscreen",
      builder: (context, state) => DetailScreens(
        todo: todos.first,
      ),
    ),
  ];
}
