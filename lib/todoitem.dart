// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todo_application/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key, required this.todo, required this.onDelete, required this.onToDochange}) : super(key: key);

  final ToDo todo;
  final onToDochange;
  final onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: (){
          //print('Clicked on ToDo Item');
          onToDochange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        tileColor: Colors.white,
        leading: Icon(todo.isDone? Icons.check_box: Icons.check_box_outline_blank_outlined, color: Colors.blue,),
        title: Text(todo.todoText!, style: TextStyle(fontSize: 16, color: Colors.black),),
        trailing: IconButton(
          onPressed: (){
            //print('Clicked on delete');
            onDelete(todo.id);
          },
          color: Colors.white,
          icon: Icon(Icons.delete, color: Colors.red,),
        ),
      ),
    );
  }
}