import 'package:flutter/material.dart';
import 'package:todo_app/contraints/color.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final todolists = Todo.todolist();
  TextEditingController todocontroller = TextEditingController();
  List<Todo> _foundtod = [];

  Widget searchbox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => runfilter(value),

        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: tdGrey),

          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  void _handletochnge(Todo i) {
    setState(() {
      i.isDone = !i.isDone;
    });
  }

  void _deleteitem(String id) {
    setState(() {
      todolists.removeWhere((item) => item.id == id);
    });
  }

  void _addition(String todo) {
    setState(() {
      todolists.add(
        Todo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todotext: todo,
        ),
      );
    });
    todocontroller.clear();
  }

  @override
  void initState() {
    _foundtod = todolists;
    // TODO: implement initState
    super.initState();
  }

  void runfilter(String enteredKeyword) {
    List<Todo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todolists;
    } else {
      results = todolists
          .where(
            (item) => item.todotext.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }

    setState(() {
      _foundtod = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBackground,
      appBar: AppBar(
        backgroundColor: tdBackground,
        title: Row(
          children: [Icon(Icons.menu_outlined, color: tdBlack, size: 30)],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/33166080/pexels-photo-33166080.jpeg",
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  searchbox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "All to Do's",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        for (Todo i in _foundtod.reversed)
                          TodoItem(
                            todo: i,
                            ontodochanged: _handletochnge,
                            ondelteitem: _deleteitem,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // shadow position
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: todocontroller,
                          decoration: InputDecoration(
                            hintText: "Add a new todo item",
                            suffixIcon: Icon(Icons.add),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: tdBlue,

                    child: Icon(Icons.add, color: Colors.white, size: 30),
                    onPressed: () {
                      _addition(todocontroller.text.toLowerCase().trim());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
