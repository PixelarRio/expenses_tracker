import 'package:flutter/material.dart';

class NewExpense extends  StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();

  }

}

class _NewExpenseState extends State<NewExpense>{

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _presentDatePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1,now.month,now.day);

    showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);

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
                 Text("Selected date"),
                 IconButton(onPressed: _presentDatePicker,
                     icon: Icon(Icons.calendar_month,))
               ],
             )


             ),



           ],
         ),
        SizedBox(height: 15),

        Row(
          children: [
            TextButton(onPressed: (){
              Navigator.pop(context);

            }, child: Text("Cancel")),
            SizedBox(width: 20),

            ElevatedButton(onPressed: (){
              print(_titleController.text);
              print(_amountController.text.toString());

            }, child: const Text("Save")),
          ],
        )
      ],
    ));

  }

}