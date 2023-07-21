import 'package:dtodo/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.green,
            label: 'Complete',
            onPressed: (context) {
              print('Completed Tıklandı!');
            },
          ),
        ],
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1,
        child: Card(
          child: Column(
            children: [
              Text(todo.title),
              Text(todo.description),
            ],
          ),
        ),
      ),
    );
  }
}
