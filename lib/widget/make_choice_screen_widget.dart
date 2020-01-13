import 'package:flutter/material.dart';

class MakeChoice extends StatelessWidget {
  final String title, hint1, hint2;
  final Color color, txtColor;
  final double w, h;
  final VoidCallback onTap;
  const MakeChoice({Key key, this.title, this.hint1, this.hint2, this.color, this.txtColor, this.w, this.h, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double l = MediaQuery.of(context).size.longestSide;
    double w1 = MediaQuery.of(context).size.width;
    double h1 = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    print(screen);
    Widget _circle(){
      return Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(h1*.01),
            width: l/99,
            height: l/99,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(100)
            ),
          ),
          Container(
            margin: EdgeInsets.all(h1*.01),
            width: l/99,
            height: l/99,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(100)
            ),
          ),
        ],
      );
    }
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
       gradient: LinearGradient(
         begin: Alignment.topLeft,
         end: Alignment.bottomRight,
         colors: color == Colors.white ? [
           Colors.grey.withOpacity(0.1),Colors.grey.withOpacity(0.2)
         ] : [color,color]
       ),
      ),
      child: RawMaterialButton(
        splashColor: txtColor ?? Colors.white,
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen ? h1*.02:h1*.04),
                child: Column(
                  children: List.generate(5, ((index){
                    return _circle();
                  })),
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(title, style: TextStyle(color: txtColor ?? Colors.white, fontSize: screen ? w1*.05:h1*.05,fontFamily: 'Montserrat-Bold'),),
                  SizedBox(height: 8,),
                  Text(
                    hint1,
                    style: TextStyle(color: txtColor?? Colors.white,height: 1.5, fontSize: screen ? w1*.03:h1*.03,fontFamily: 'Montserrat-Black', letterSpacing: 1),
                  ),
                  Text(
                    hint2,
                    style: TextStyle(color: txtColor ?? Colors.white,height: 1.5, fontSize:screen ?w1*.03:h1*.03,fontFamily: 'Montserrat-Black', letterSpacing: 1),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: txtColor ?? Colors.white,size: screen ?w1*.08:h1*.08,),
            ],
          ),
        ),
      ),
    );
  }
}
