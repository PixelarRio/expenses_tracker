

import 'package:expenses_tracker/widgets/chart/chart.dart';
import 'package:expenses_tracker/widgets/expenses/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses/expenses_list.dart';
import 'package:expenses_tracker/widgets/chart/chart.dart';


class Expeneses extends StatefulWidget{
  const Expeneses({super.key});

  @override
  State<Expeneses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expeneses>{
  final List<Expense> _registeredExpenses = [

  ];

void _openAddExpenseOverlay(){

  showModalBottomSheet(context: context,
      useSafeArea: true,
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

  final width = MediaQuery.of(context).size.width;

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
      body: width < 600 ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
         Chart(expenses: _registeredExpenses),
          const SizedBox(height: 30,),
          Expanded(child : mainContent),
        ],
      ): Row(
        children: [
          const SizedBox(height: 30,),
          Expanded(child: Chart(expenses: _registeredExpenses)),
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