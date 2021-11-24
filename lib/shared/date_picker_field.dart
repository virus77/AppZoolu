import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final DateTime initialDate;
  final TextEditingController controller;

  final Function(String newValue) onChanged;

  DatePickerField(
      {this.labelText, this.icon, this.onChanged, this.initialDate, this.controller});

  @override
  _DatePickerField createState() => _DatePickerField(
      labelText: this.labelText,
      icon: this.icon,
      onChanged: this.onChanged,
      initialDate: this.initialDate);
}

class _DatePickerField extends State<DatePickerField> {
  final String labelText;
  final IconData icon;
  final Function(String newValue) onChanged;
  final DateTime initialDate;
  final TextEditingController controller;

  final DateFormat dateFormat = new DateFormat('dd/MM/yyyy');

  _DatePickerField(
      {this.labelText, this.icon, this.onChanged, this.initialDate, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: GestureDetector(
            onTap: _chooseDate,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: this.labelText,
                  icon: Icon(
                    icon,
                    color: Colors.black38,
                  ),
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Sans',
                      letterSpacing: 0.3,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _chooseDate() {
    Future<DateTime> selectedDate = showDatePicker(
      context: context,
      initialDate: this.initialDate,
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );

    selectedDate.then((value) {
      if (value != null) {
        setState(() {
          this.controller.text = dateFormat.format(value);
        });
      } else {
        this.controller.text = null;
      }
    });
  }
}
