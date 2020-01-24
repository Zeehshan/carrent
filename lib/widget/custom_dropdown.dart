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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(height: 10,),

        Container(
          height: 18,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              widget?.hintText ?? "",
              style: TextStyle(
                fontFamily: 'Montserrat-Bold',
                color: Colors.grey,
                fontSize: 16.0
              ),
            ),
          ),
        ),

        Container(
          height: 20,
          child: DropdownButton<dynamic>(
            value: widget.selectedValue?.toString(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[600],
            ),
            iconSize: 24,
            elevation: 0,
            isExpanded: true,
            style: TextStyle(
              fontFamily: 'Montserrat-Bold',
              color: Colors.black,
            ),
            underline: Container(
//        height: 1,
//        color: Colors.black,
                ),
            onChanged: widget.onChangeFun,
            items:
                widget.listData.map<DropdownMenuItem<dynamic>>((dynamic value) {
              return DropdownMenuItem<dynamic>(
                value: value.toString(),
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat-Bold',
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.black,
          width: double.maxFinite,
          height: 1.0,
        ),
      ],
    );
  }
}
