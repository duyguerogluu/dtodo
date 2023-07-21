import 'package:dtodo/models/home_view_model.dart';
import 'package:dtodo/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Duygu ToDo "),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child:
                Consumer<HomeViewModel>(builder: (context, state, child) {
              return ListView.builder(
                itemCount: state.allTodos.length,
                itemBuilder: (context, index) {
                  Todo todo = state.allTodos[index];
                  return state.allTodos.isEmpty
                      ? const Center(
                          child: Text('0 Todos',
                              style: TextStyle(color: Colors.black)),
                        )
                      : ListTile(
                          title: Text(todo.title),
                          subtitle: Text(todo.description ?? ''),
                        );
                },
              );
            }))
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    //Form Key
    final formKey = GlobalKey<FormState>();

    Widget addButton = ElevatedButton(
      onPressed: () {
        //create todo object
        Todo todo = Todo(
          titleController.text,
          descController.text,
          false,
        );
        if (formKey.currentState!.validate()) {
          Provider.of<HomeViewModel>(context, listen: false).addTodo(todo);
          titleController.text = '';
          descController.text = '';
          Navigator.pop(context);
        }
      },
      child: const Text('Add Todo'),
    );

    Widget cancelButton = ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel', style: TextStyle(color: Colors.red)),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Add Todo'),
      content: Form(
        key: formKey,
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Title'),
                ),
                controller: titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ('please write a title');
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Description'),
                ),
                controller: descController,
              ),
            ],
          ),
        ),
      ),
      actions: [
        addButton,
        cancelButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
