import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final dynamic selectedValue;
  final String hintText;
  final Function onChangeFun;
  final List listData;

  const CustomDropDown(
      {Key key,
      this.selectedValue,
      this.hintText,
      this.onChangeFun,
      this.listData})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      value: widget.selectedValue?.toString(),

      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey[600],
      ),
      iconSize: 24,
      elevation: 20,
      hint: Text(
        widget?.hintText ?? "",
        style: TextStyle(fontFamily: 'Montserrat-Bold',color: Colors.grey,),
      ),
      isExpanded: true,
      style: TextStyle(fontFamily: 'Montserrat-Bold',color: Colors.black,),
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: widget.onChangeFun,
      items: widget.listData.map<DropdownMenuItem<dynamic>>((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: value.toString(),
          child: Text(
            value.toString(),
            style: TextStyle(fontFamily: 'Montserrat-Bold',color: Colors.black,),
          ),
        );
      }).toList(),
    );
  }
}
