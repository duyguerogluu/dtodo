class Todo {
  String title;
  String description;
  bool completed = false;

  Todo(
    this.title,
    this.description,
    this.completed,
  );

  Map toMap() {
    return {
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  Todo fromMap(Map map) {
    return Todo(
      title = map['title'] as String,
      description = map['description'] as String,
      completed = map['completed'] as bool,
    );
  }

  void completedTodo() {
    completed = !completed;
  }
}
