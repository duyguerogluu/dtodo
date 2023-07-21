import 'package:dtodo/models/todo.dart';
import 'package:flutter/material.dart';

class DetailScreens extends StatelessWidget {
  const DetailScreens({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            IconButton(
              icon: const Icon(Icons
                  .arrow_back_ios), // İconButton içinde göstermek istediğiniz ikon
              onPressed: () {
                Navigator.pop(context);
                print("IconButton Tıklandı!");
              },
            ),
            Text(todo.title),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(todo.title),
          Text(todo.description),
        ],
      ),
    ));
  }
}
