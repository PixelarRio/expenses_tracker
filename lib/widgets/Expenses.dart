

import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/widgets/AddExpenses.dart';

class Expeneses extends StatefulWidget{
  const Expeneses({super.key});

  @override
  State<Expeneses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expeneses>{
  final List<Expense> _registeredExpenses = [
    Expense(title: "FlutterCourse", amount: 19.99 , date: DateTime.now(), category: Category.work),
    Expense(title: "Movie", amount: 50.00 , date: DateTime.now(), category: Category.leisure),


  ];



  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Expenses"),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpenses() ));
          }, icon: const Icon(
            Icons.add
          ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          Container(
            height: 200,
            width: 350,

            decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 30,),
          Expanded(child :ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }

}