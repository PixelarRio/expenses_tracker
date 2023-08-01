
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

class NewExpense extends  StatefulWidget{
  const NewExpense({super.key,required this.onAddExpense});


  final Function(Expense expense) onAddExpense;


  @override
  State<NewExpense> createState() {
    return _NewExpenseState();

  }

}

class _NewExpenseState extends State<NewExpense>{

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;


  void _presentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1,now.month,now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });

  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount < 0;

    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(context: context, builder: (ctx)=>AlertDialog(
        title: Text("Invalid input"),
        content: Text("Please make sure a valid title , amount , date and category was entered."),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(ctx);
        }, child: Text("okay"))
      ],
      )
      );
      return;
    }

    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
    )
    );
  }
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.all(16),
    child:Column(
      children: [
         TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text("Title"),

          ),
        ),
         Row(
           children: [
             Expanded(child:TextField(

               keyboardType: TextInputType.number,
               controller: _amountController,
               decoration: const InputDecoration(
                 prefixText: "\$ ",
                 label: Text("Amount"),
               ),
             ), ),
            const  SizedBox(
               width: 16
             ),

             Expanded(child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(_selectedDate == null ? "No date Selected" : formatter.format(_selectedDate!)),
                 IconButton(onPressed: _presentDatePicker,
                     icon: const Icon(Icons.calendar_month,))
               ],
             )


             ),

           ],
         ),
        const SizedBox(height: 16),

        Row(
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: Category.values.map(
                (category) => DropdownMenuItem(
                value: category,
                child : Text(category.name.toUpperCase(),
                ),
                ),

            ).toList(), onChanged: (value){
              setState(() {
                if(value == null){
                  return;
                }
                setState(() {
                  _selectedCategory = value;

                });

              });
            }),
            const Spacer(),

            TextButton(onPressed: (){
              Navigator.pop(context);

            }, child: const Text("Cancel")),
            const SizedBox(width: 20),

            ElevatedButton(onPressed: _submitExpenseData, child: const Text("Save")),
          ],
        )
      ],
    ));

  }

}