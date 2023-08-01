

import 'package:expenses_tracker/widgets/expenses/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses/expenses_list.dart';


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

void _openAddExpenseOverlay(){
  showModalBottomSheet(context: context, builder: (ctx) => NewExpense(onAddExpense: _addExpense));

}

void _addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add( expense);
  });


}
  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker",style: TextStyle(
            fontWeight: FontWeight.w400)),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(onPressed: _openAddExpenseOverlay,
              icon: const Icon(
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