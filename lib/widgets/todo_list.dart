import 'package:dtodo/models/todo.dart';
import 'package:dtodo/providers/todo_provider.dart';
import 'package:dtodo/screens/detail_screens.dart';
import 'package:dtodo/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, state, child) => ListView.builder(
          itemCount: state.unCompletedTodos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreens(todo: state.unCompletedTodos[index])),
                );
              },
              child: TodoCard(
                todo: state.unCompletedTodos[index],
              ),
            );
          }),
    );
  }
}
