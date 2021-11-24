import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownCustomButton extends StatefulWidget {
  final IconData icon;
  final List<String> items;
  final TextEditingController controller;

  DropdownCustomButton({this.icon, this.items, this.controller});

  @override
  _DropdownCustomButton createState() => _DropdownCustomButton(
      icon: this.icon,
      items: this.items,
      controller: this.controller);
}

class _DropdownCustomButton extends State<DropdownCustomButton> {
  final IconData icon;
  final List<String> items;
  TextEditingController controller = new TextEditingController();

  Function(String newValue) onChanged;

  _DropdownCustomButton({this.icon, this.items, this.controller});

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
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black38,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 9.0)),
              DropdownButton<String>(
                value: this.controller.text,
                onChanged: (String selectedValue) {
                  setState(() {
                    this.controller.text = selectedValue;
                  });
                },
                items: this.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
