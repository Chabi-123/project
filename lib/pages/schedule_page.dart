import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';



class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<ScheduleItem> _items = [];

  void _addItem(String title, TimeOfDay time) {
    setState(() {
      _items.add(ScheduleItem(title, time));
    });
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(onSubmit: _addItem),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Schedule',style: myStyle(22,Colors.white,FontWeight.bold),),
        backgroundColor:primaryColor,
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),

      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index].title,style: myStyle(25,Colors.black,FontWeight.bold)),
            subtitle: Text(_items[index].time.format(context),style: myStyle(18,Colors.black,FontWeight.bold)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddItemDialog extends StatefulWidget {
  final void Function(String, TimeOfDay) onSubmit;

  AddItemDialog({required this.onSubmit});

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_titleController.text, _selectedTime);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Schedule Item'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Time: ${_selectedTime.format(context)}'),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _selectedTime = pickedTime;
                      });
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _submit,
          child: Text('Add'),
        ),
      ],
    );
  }
}

class ScheduleItem {
  final String title;
  final TimeOfDay time;

  ScheduleItem(this.title, this.time);
}
