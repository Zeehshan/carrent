import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class TimePickerField extends StatelessWidget {

  final String text;
  final Function onClick;
  final DateTime dateTime;

  const TimePickerField({Key key, this.text, this.onClick, this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                dateTime??text,
                style: TextStyle(
                    fontFamily: 'Montserrat-Bold',
                    color: Colors.grey,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
