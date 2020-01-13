import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:flutter/material.dart';

class PaymentChoice extends StatefulWidget {
  @override
  _PaymentChoiceState createState() => _PaymentChoiceState();
}

class _PaymentChoiceState extends State<PaymentChoice> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scafoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: screen?h*.05:w*.05,),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Util.baseColor,size: screen?w*.08:h*.08,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 5,),
                Text("My Financial Setup", style: TextStyle(fontSize: screen?w*.05:h*.05, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Image.asset('assets/images/drawer.png',width:screen?w*.1:h*.1,),
                      onTap: (){
                        _scafoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h*.06,),
            Padding(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: Text("For renting a car or recieving renting payment,"
          " Please define your finacial setup by adding (Crdit or PayPal account)",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize:screen?w*.03:h*.03),),
    ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text.rich(
                TextSpan(
                  text: 'You can as many credit card as you wish ',
                  children: [
                    TextSpan(
                      text: 'only one method from all will be active',
                      style: TextStyle(color: Util.baseColor)
                    ),
                  ]
                ),
                  style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize: screen?w*.03:h*.03)
              ),
            ),
            SizedBox(height: 30,),
            CommanButton(
              width: w*.6,
              text: 'Add Credit Card',
              onPressed: (){
              },
            ),
            SizedBox(height: 12,),
            CommanButton(
              color: Color.fromRGBO(29, 39, 125, 1.0),
              width: w*.6,
              text: 'Add PayPal Account',
              onPressed: (){
              },
            ),
            SizedBox(height: h*.3,),
            CommanButton(
              width: w*.4,
              text: 'Save',
              onPressed: (){
              },
            ),
            SizedBox(height: screen?w*.09:h*.09,),
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}
