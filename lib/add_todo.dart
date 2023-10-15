import 'package:flutter/material.dart';

import 'package:untitled/todo_list.dart';


class AddNewTodo1 extends StatefulWidget {
  final Function(Todo) onTapAdd1;
  const AddNewTodo1({super.key, required this.onTapAdd1});

  @override
  State<AddNewTodo1> createState() => _AddNewTodo1State();
}

class _AddNewTodo1State extends State<AddNewTodo1> {

  final TextEditingController _titleTextEditingController =TextEditingController();
    final TextEditingController _descripTextEditingController =TextEditingController();
  final  GlobalKey<FormState>_forKey =GlobalKey<FormState>();
  String? _text;
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: _forKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                     
                       const SizedBox(height: 15,),
                      TextFormField(
                        textAlign: TextAlign.start,
                        focusNode: FocusNode(),
                        controller: _titleTextEditingController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (value){
                          if(value ==null || value.isEmpty){
                            return "Please enter value";
                          };
                          if(double.tryParse(value) ==null){
                            return "Please enter a valid number";
                          }
                          return null;
                        
                        },
                        onChanged: (value) {
                          _text = value;
                        },
                        // maxLines: 2,
                        decoration:  InputDecoration(
                          focusColor: Colors.cyan.shade700,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: "Add title"
                        ),
                      ),
                      const SizedBox(height: 15,),
                       TextFormField(
                        controller: _descripTextEditingController,
                        validator: (value) {
                          if(value?.isEmpty??true){
                            return "Enter text or number";
                          }
                          return null;
                        },
                        // maxLines: 5,
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: "Add description"
                        ),
                      ),
                      SizedBox(height:  MediaQuery.of(context).size.height*0.05,),
                      ElevatedButton(
                        
                        onPressed: (){
                          
                          if(_forKey.currentState!.validate()){
                            _forKey.currentState!.save();
                            Todo todo = Todo(
                              title: _titleTextEditingController.text.trim(), 
                              descriptin: _descripTextEditingController.text.trim());
                              widget.onTapAdd1(todo);
                          }
                      
                        }, 
                         child: const Text("Add"),
                         )
                    ],
                  ),
                ),
              );
  }
}