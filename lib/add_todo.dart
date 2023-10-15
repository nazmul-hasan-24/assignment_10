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
  @override
  void initState() {
    
    super.initState();
  }
@override
  

  String validation_input(String input){
    final regexp = RegExp(r'^[a-aA-Z0-9]+[,.]{0,1}[0-9]*$');
    if(!regexp.hasMatch(input)){
      return "Please enter a valid Text or number";
    }
    return 'null';
  }

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
                       validator: (value) {
                          if(value?.isEmpty??true){
                            return "Enter text or number";
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                        focusNode: FocusNode(),
                        controller: _titleTextEditingController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration:  InputDecoration(
                          focusColor: Colors.cyan.shade700,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
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
                            borderRadius: BorderRadius.circular(8.0)
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
                      _descripTextEditingController.clear();
                      _titleTextEditingController.clear();
                        }, 
                         child: const Text("Add"),
                         )
                    ],
                  ),
                ),
              );

              
  }
 }
