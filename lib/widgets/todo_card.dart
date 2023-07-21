import 'package:dtodo/models/todo.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(todo.title),
          Text(todo.description),
        ],
      ),
    );
  }
}
