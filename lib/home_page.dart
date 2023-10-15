import 'package:flutter/material.dart';
import 'package:untitled/add_todo.dart';
import 'package:untitled/todo_list.dart';
import 'package:untitled/update_todo.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList1 = [
    Todo(title: "Todo 1", descriptin: "Description 1"),
    Todo(title: "Todo 2", descriptin: "Description 2")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do")),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet(
      //         // enableDrag: false,
      //         isScrollControlled: true,
      //         context: context,
      //         builder: (
      //           context,
      //         ) {
      //           return AddNewTodo1(
      //             onTapAdd1: (Todo todo) {
      //               addTodo1(todo);
      //             },
      //           );
      //         });
      //   },
      //   child: const Icon(Icons.add),
      // ),
      body: ListView(
        shrinkWrap: true,
        children:[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            
              AddNewTodo1(onTapAdd1: (Todo todo){
                addTodo1(todo);
              })
            ],
          ),
          const SizedBox(height: 40,),
           ListView.separated(
            shrinkWrap: true,
          itemCount: todoList1.length,
          itemBuilder: (context, int index) {
            final todo1 = todoList1[index];
            return ListTile(
              tileColor: Colors.green.withOpacity(0.05),
              title: Text(todo1.title),
              subtitle: Text(todo1.descriptin),
              
              leading: const CircleAvatar(backgroundColor: Colors.redAccent),
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 2,
                      contentPadding: const EdgeInsets.all(10),
                       alignment: Alignment.center,
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                     
                      title: const Text("Alert", ),
                      content: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                 showModalBottomSheet(
                                  context: context,
                                   builder: (context){
                                    return UpdateTodo(   //update todo
                                      onTabAdd: (String updateTitle){
                                        updateTodoTitle(index, updateTitle);
                                      },
                                      onTabDes: (String des) {
                                        updateTodoDescription(index, des);
                                      },
                                       todo: todo1);
                                   }
                                   );
                                  
                                },
                                child: const Text("Edit"),
                              )
                            ],
                          ),
                         
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  deleteTodo1(index);
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete"),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 10,
              color: Colors.white,
            );
          },
        ),
     ] ),
    );
  }

  void addTodo1(Todo todo) {
    todoList1.add(todo);
    setState(() {});
  }

  void deleteTodo1(int index) {
    todoList1.removeAt(index);
    setState(() {});
  }

  void updateTodoTitle(int index, String todoTitle ) {
    todoList1[index].title = todoTitle;
    // todoList1[index].descriptin =todoDes;
    setState(() {});
  }

  void updateTodoDescription(int index, String todoDes) {
    todoList1[index].descriptin = todoDes;
    setState(() {});
  }
}
