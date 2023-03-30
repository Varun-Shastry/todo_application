// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todo_application/todoitem.dart';
import 'package:todo_application/todo.dart';


class Home extends StatefulWidget {
  Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(230, 230, 230, 230),
        leadingWidth: 15,
        title: Row(
          children: [
            Icon(Icons.menu, color: Colors.black, size: 30),
          ],
        ),
      ),

      body:  Stack(
        children: [
          Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child:ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  child: Text('All ToDos', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                ),

                for(ToDo todo in todoList)
                ToDoItem(todo: todo, onToDochange: handleToDoChange, onDelete: deletItem ),
              ],
            ) 
            ),
          ],
        ),
      ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                       offset: Offset(0.0, 0.0),
                        blurRadius: 10,
                         spreadRadius: 0),],
                    borderRadius: BorderRadius.circular(10),
                  ),
              child: TextField(
                controller: todoController,
                decoration: InputDecoration(
                  hintText: "Add new to do item",
                  border: InputBorder.none,
                ),
              ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  onPressed: (){
                    addItem(todoController.text);
                  },
                  child: Text('+', style: TextStyle(fontSize: 40),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        ],
      ),
      
    );
  }

  void handleToDoChange (ToDo todo){
    setState((){
      todo.isDone = !todo.isDone;
    });
  }

  void deletItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addItem(String todo){
    setState(() {
      todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo));
    });

    todoController.clear();
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  prefixIcon: Icon(Icons.search, color: Colors.black, size: 20,),
                  prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(230, 119, 116, 116),
                  ),

                ),
              ),              
            ),
          ],
      ),
      );
  }
}

class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color.fromARGB(230, 230, 230, 230),
        leadingWidth: 15,
        title: Row(
          children: [
            Icon(Icons.menu, color: Colors.black, size: 30),
          ],
        ),
      );
  }
}