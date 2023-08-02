

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
  showModalBottomSheet(context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense));

}

void _addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add( expense);
  });




}
  @override
  Widget build( context) {

  Widget mainContent = const Center(
    child: Text("No Expenses Found. Start Adding some!"),
  );
  if(_registeredExpenses.isNotEmpty){
    mainContent = ExpensesList(
    expenses: _registeredExpenses,
    onRemoveExpense: _removeExpense,
    );

  }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: <Widget>[
          IconButton(onPressed: _openAddExpenseOverlay,
              icon: const Icon(
            Icons.add,
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
          Expanded(child : mainContent),
        ],
      ),
    );
  }
  void _removeExpense(Expense expense){
  final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 5),
            content: const Text("Deleted"),
            action:SnackBarAction(label: "Undo", onPressed: (){
              setState(() {
                _registeredExpenses.insert(expenseIndex,expense);
              });
            })
        )

    );
  }

}