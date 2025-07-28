import 'package:flutter/material.dart';
import 'package:todo_app/contraints/color.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.ontodochanged,
    required this.ondelteitem,
  });

  final Todo todo;
  final ontodochanged;
  final ondelteitem;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        onTap: () {
          widget.ontodochanged(widget.todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          widget.todo.isDone
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: tdBlue,
        ),
        title: Text(
          widget.todo.todotext,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: widget.todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        // subtitle: Text("description"),
        trailing: Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 35,
          width: 35,

          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            onPressed: () {
              widget.ondelteitem(widget.todo.id);
            },
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
