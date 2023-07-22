import 'package:dtodo/models/todo.dart';
import 'package:dtodo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () {
            Provider.of<TodoProvider>(context, listen: false).removeTodo(todo);
          },
        ),
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: 'Remove',
            backgroundColor: Colors.red,
            onPressed: (context) {
              Provider.of<TodoProvider>(context, listen: false)
                  .removeTodo(todo);
            },
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            Provider.of<TodoProvider>(context, listen: false).toggleTodo(todo);
          },
        ),
        children: [
          SlidableAction(
            backgroundColor: Colors.green,
            label: 'Complete',
            onPressed: (context) {
              Provider.of<TodoProvider>(context, listen: false)
                  .toggleTodo(todo);
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
