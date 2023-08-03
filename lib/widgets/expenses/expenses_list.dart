import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses/add_expense.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context,index)=> Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(

          color: Theme.of(context).colorScheme.error.withOpacity(1.0),
          margin:  EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),

          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.delete,color: Colors.white),
          )
          ],


          ),
        ),
        onDismissed: (direction) => onRemoveExpense(expenses[index]) ,
        child: ExpenseItem(expenses[index] ),
      ),

      );
  }

}