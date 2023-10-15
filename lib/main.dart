

import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Assignment 10",
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent)
          )
        )
      ),
      home:const HomeScreen(),
    );
  }
}

class Dispose extends StatefulWidget {
  const Dispose({super.key});

  @override
  State<Dispose> createState() => _DisposeState();
}

class _DisposeState extends State<Dispose> {
  final TextEditingController te = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    te.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
        Form(
          child: TextFormField(
            controller: te,
          ),
        ),
        ElevatedButton(onPressed: (){

        }, child: const Text("Add"))
        ],
      ),),
    );
  }
}

