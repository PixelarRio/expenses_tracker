import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses/add_expense.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context,index)=> ExpenseItem(expenses[index]),

      );
  }

}