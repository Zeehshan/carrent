import 'package:flutter/material.dart';


class SocialButton extends StatelessWidget {
  final int id;
  final String text;
  final VoidCallback onPressed;
  SocialButton({this.id, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = BorderRadius.horizontal(right: Radius.circular(id == 1 ? 50 : 0), left: Radius.circular(id == 2 ? 50 : 0));
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Container(
      height: screen?h*.06:w*.07,
      width: (w*0.5)-10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],

      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Row(
          mainAxisAlignment: id == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: id == 2 ? 14 : 0,),
            id == 2 ? Image.asset("assets/google-png-images-8.png", height: 30,) : Container(),
            SizedBox(width: 8,),
            Text(text ?? "", style: TextStyle(fontFamily: 'Montserrat-SemiBold', fontSize: screen?w*.03:h*.03)),
           id == 1 ? Image.asset("assets/facbook-icon-png-4.jpg", height: 40,) : Container(),
            SizedBox(width: id == 1 ? 14 : 0,),
          ],
        ),
      ),
    );
  }
}
