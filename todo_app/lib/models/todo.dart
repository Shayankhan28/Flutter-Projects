class Todo {
  String id, todotext;
  bool isDone;

  Todo({required this.id, required this.todotext, this.isDone = false});

  static List<Todo> todolist() {
    return [
      Todo(id: "01", todotext: "Morning gym", isDone: true),
      Todo(id: "02", todotext: "Check health", isDone: true),
      Todo(id: "03", todotext: "Team Meeting"),
      Todo(id: "04", todotext: "Complete 100 DSA question"),
      Todo(id: "05", todotext: "Going to ISL"),
      Todo(id: "06", todotext: "Evening Walk"),
    ];
  }
}
