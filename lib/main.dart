import 'package:dtodo/providers/todo_provider.dart';
import 'package:dtodo/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp(
    title: '',
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: "Todo Application",
        home: const HomeView(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
