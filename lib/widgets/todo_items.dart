import 'package:flutter/material.dart';
import 'package:todo_list_task_3/constants/Colors.dart';
import 'package:todo_list_task_3/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
     child: ListTile(
      onTap: (){
        // print('Clicked on ToDo Item');
        onToDoChanged(todo);
      },
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),
       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      tileColor: Colors.white,
      leading: Icon(
        todo.isDone? Icons.check_box: Icons.check_box_outline_blank,
        color: myBlue,
      ),
       title: Text( todo.todoText!,
       style: TextStyle(fontSize: 16, color: myBlack,
           decoration: todo.isDone? TextDecoration.lineThrough: null
       ),
       ),
       trailing: Container(
         padding: EdgeInsets.all(0),
         margin: EdgeInsets.symmetric(vertical: 12),
         height: 35,
         width: 35,
         decoration: BoxDecoration(
           color: myRed,
           borderRadius: BorderRadius.circular(5),
         ),
         child: IconButton(
           color:Colors.white,
           iconSize: 18,
           icon: Icon(Icons.delete),
           onPressed: () {
             onDeleteItem(todo.id);
           },
         ),
       ),
    ),
    );
  }
}
