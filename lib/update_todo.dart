import 'package:flutter/material.dart';
import 'package:untitled/todo_list.dart';



class UpdateTodo extends StatefulWidget {
final Todo todo;
 final Function(String) onTabAdd;
 final Function(String) onTabDes;
   const UpdateTodo({
    super.key,
    required this.onTabAdd,
    required this.onTabDes,
     required this.todo});

  @override
  State<UpdateTodo> createState() => UpdateTodo1State();
}

class UpdateTodo1State extends State<UpdateTodo> {

  late TextEditingController _titleTextEditingController ;
    late TextEditingController _descripTextEditingController;

    @override
  void initState() {
    super.initState();
    _titleTextEditingController = TextEditingController(text: widget.todo.title);
    _descripTextEditingController =TextEditingController(text:widget.todo.descriptin );
  }
  final  GlobalKey<FormState>_forKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: _forKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Add new todo" ,style: Theme.of(context).textTheme.titleMedium,),
                         IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close, color: Colors.red,))
                        ],
                      ),
                       const SizedBox(height: 15,),
                      TextFormField(
                        controller: _titleTextEditingController,
                        
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          hintText: "Add title"
                        ),
                      ),
                      const SizedBox(height: 15,),
                       TextFormField(
                        controller: _descripTextEditingController,
                    
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          hintText: "Add descriptin"
                        ),
                      ),
                       const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: (){
                         widget.onTabAdd(_titleTextEditingController.text.trim());
                         widget.onTabDes(_descripTextEditingController.text.trim());
                        Navigator.pop(context);
                        }, 
                         child: const Text("Update"),
                         ),
                    ],
                  ),
                ),
              );
  }
}