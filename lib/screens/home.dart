import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/task_type.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//List<String> todo = ["Study lessons","Run 5k","Go to party"];
//List<String> complated = ["Game meetup","Take trash out"]; 



class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
  Task(type: TaskType.note,
    title: "Study Lessons",
    description: "Study Flutter", 
    isComplated: false),
  Task(type: TaskType.calender,
    title: "Go to party",
    description: "Attend to party", 
    isComplated: false),
  Task(type: TaskType.contest,
    title: "Run 5k",
    description: "Run 5 kilometers", 
    isComplated: false),
    Task(type: TaskType.contest,
    title: "Trash out",
    description: "Take trash out", 
    isComplated: false)
    
];
List<Task> complated = [
  Task(type: TaskType.calender,
    title: "Go to party",
    description: "Attend to party", 
    isComplated: false),
  Task(type: TaskType.contest,
    title: "Run 5k",
    description: "Run 5 kilometers", 
    isComplated: false)
];
  void addNewTask(Task newTask){
    setState(() {
      todo.add(newTask);
    });
  }
  @override
  Widget build(BuildContext context) {
    double projectWidthSize = MediaQuery.of(context).size.width; 
    double projectHeightSize = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              //Header
              Container(
                width: projectWidthSize,
                height: projectHeightSize /3,
                color:  Colors.teal,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text("June 15, 2024",
                      style: 
                        TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 45),
                          child: 
                          Text("My Todo List",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40
                          ) ,),
                        )
                ]),
              ),
              //Top column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(task: todo[index],);
                      },
                    )
                    )
                  ),
                ),
    
              
              //complated text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("complated",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
                ),
              ),
              //Buttom column
              Expanded(
               child: Column(
                children: [
                  Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: complated.length,
                      itemBuilder: ((context, index) {
                        return TodoItem(task: complated[index]);                      }))
                  ),
                ),
              )
                ],
               ),
              ),
              
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: 
                  (context)=> AddNewTaskScreen(
                    addNewTask: (newTask) =>addNewTask(newTask),                     )
                  ));
              }, 
              child: const Text("add new Task")
              ),
        ])
        ),
          ),
          
        );
  }
}