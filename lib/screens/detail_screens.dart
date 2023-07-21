import 'package:dtodo/models/todo.dart';
import 'package:flutter/material.dart';

class DetailScreens extends StatelessWidget {
  const DetailScreens({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Text(todo.title),
        Text(todo.description),
      ],
    ));
  }
}
