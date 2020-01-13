import 'package:flutter/material.dart';


class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  final TextInputType inputType;
  CustomTextFieldWidget({this.controller, this.labelText, this.hintText, this.inputType});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        TextFormField(
          scrollPadding: EdgeInsets.all(0),
          controller: controller,
          keyboardType: inputType,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: "   "+labelText,
            labelStyle: TextStyle(fontFamily: 'Montserrat-Bold',color: Colors.grey,height:.2),
            hintText: hintText,
            enabledBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black38),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }
}