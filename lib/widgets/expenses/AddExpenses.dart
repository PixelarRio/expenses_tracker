import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget{
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() {
    return _AddExpenses();

  }

}

class _AddExpenses extends State<AddExpenses>{
  @override
  Widget build( context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("AddExpenses"),
        backgroundColor: Colors.indigo,
      ),

      body: Column(
        children: const[
          TextField(decoration: InputDecoration(

          ),)
        ],
      ),

    );

  }

}