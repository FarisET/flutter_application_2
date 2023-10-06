import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String location = '';
  String description = '';
  DateTime date = DateTime.now();
  bool? riskLevel = false;
  //TODO: attach image var
  //TODO: incident tpye var
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report an Incident'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:_formKey,
          child: Column(children: [
      
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name the location, area or site',
              ),
              validator: (value) {
                if (value != null || value!.isEmpty) {
                  return 'Enter Something';
                } return null;
              },
              onChanged: (value) {
                location = value;
              },
      
            ),

            //TODO:Incident Type
      
          TextFormField(
              decoration: const InputDecoration(
                hintText: 'Describe the incident in a few words',
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value != null || value!.isEmpty) {
                  return 'Enter Something';
                } return null;
              },
              onChanged: (value) {
                description = value;
              },
              maxLines: 5,
                      ),

          _FormDatePicker(
              date: date,
              onChanged: (value) {
                setState(() {
                  date = value;
                });
              },
            ),

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Incident Severity',
                style: Theme.of(context).textTheme.titleSmall,
                ),

                RiskLevel()
              ],
            )
            


            

            
            
          ],)
             ),
      ),

    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  State<_FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

              const Divider(
                  height: 20,
                  color: Colors.green,
                  ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.titleMedium,
              
              
            ),
            Text(
              intl.DateFormat.Hm().format(widget.date),
              style: Theme.of(context).textTheme.titleMedium,
              )

          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDateTime = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDateTime == null) {
              return;
            }

             // Show time picker
            final newTimeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(widget.date),
            );

            if (newTimeOfDay == null) {
              return;
            }

            // Combine the selected date and time into a new DateTime
            final combinedDateTime = DateTime(
              newDateTime.year,
              newDateTime.month,
              newDateTime.day,
              newTimeOfDay.hour,
              newTimeOfDay.minute,
            );

            widget.onChanged(combinedDateTime);

           // widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}

class RiskLevel extends StatefulWidget {
  const RiskLevel({Key? key}) : super(key: key);

  @override
  _RiskLevelState createState() => _RiskLevelState();
}

class _RiskLevelState extends State<RiskLevel> {
  String? _selectedRiskLevel;

  @override
  Widget build(BuildContext context) {
        return Column(
          children: [
            RadioListTile<String>(
              title: const Text('Minor'),
              value: 'Minor',
              groupValue: _selectedRiskLevel,
              onChanged: (String? value) {
                setState(() {
                  _selectedRiskLevel = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Serious'),
              value: 'Serious',
              groupValue: _selectedRiskLevel,
              onChanged: (String? value) {
                setState(() {
                  _selectedRiskLevel = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Fatal'),
              value: 'Fatal',
              groupValue: _selectedRiskLevel,
              onChanged: (String? value) {
                setState(() {
                  _selectedRiskLevel = value;
                });
              },
            ),
          ],
        );
       
    
  }
}

