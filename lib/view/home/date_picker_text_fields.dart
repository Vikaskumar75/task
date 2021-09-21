import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerTextFields extends StatelessWidget {
  const DatePickerTextFields({
    Key? key,
    required this.controller,
    this.labelText,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: Colors.teal[600],
                accentColor: Colors.white,
                colorScheme: ColorScheme.light(
                  primary: Colors.teal[600]!.withOpacity(0.8),
                ),
                buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          controller.text = DateFormat('dd-MM-yyyy').format(date);
        }
      },
      child: TextField(
        controller: controller,
        readOnly: true,
        enabled: false,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: Icon(
            CupertinoIcons.calendar,
            color: Theme.of(context).primaryColor,
          ),
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Theme.of(context).primaryColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
