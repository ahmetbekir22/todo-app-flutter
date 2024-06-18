import 'package:flutter/material.dart';
import 'package:todo_app/constants/task_type.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key,required this.task});
  final Task task;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
              color: widget.task.isComplated? Colors.grey: Colors.white,       
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         widget.task.type ==TaskType.note ?
                          Image.asset("lib/assets/images/category_1.png"): 
                          widget.task.type == TaskType.contest ? 
                          Image.asset("lib/assets/images/category_3.png") :Image.asset("lib/assets/images/category_2.png"),
                         
                              Expanded(
                                child: Column(
                                    children: [
                                      Text(widget.task.title,
                                      
                                      style:  TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        decoration: widget.task.isComplated? TextDecoration.lineThrough:TextDecoration.none
                                      ),
                                      ),
                                      Text(widget.task.description,style: 
                                      TextStyle(decoration:
                                      widget.task.isComplated? 
                                      TextDecoration.lineThrough:TextDecoration.none),)
                                    ],
                                    ),
                              ),
                              Checkbox(value: isChecked, 
                                onChanged: (val)=> {
                                  setState((){
                                    widget.task.isComplated = !widget.task.isComplated;
                                    isChecked = val!; //null safety.
                                  })
                                })
                            ],
                          ),
                        ) ,
                );
              }
            }