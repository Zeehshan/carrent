
import 'package:car_rental/ruotes.dart';
import 'package:car_rental/screen/auth/account_created_page.dart';
import 'package:car_rental/screen/auth/signup_screen.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerifiedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height:screen ? h*.04 : h*.08,),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Util.baseColor,size: screen ? w*.08 : h*.08,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 5,),
                Text("E-mail verify", style: TextStyle(fontSize:screen?w*.05:h*.05, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),
              ],
            ),
            SizedBox(height: screen ? h*.08 : w*.09,),
            Text("You've just recieved an email",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey.withOpacity(0.6),fontSize: screen?w*.04:h*.04),),
            Text("containing a verification code on",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey.withOpacity(0.6),fontSize: screen?w*.04:h*.04)),
            SizedBox(height:10,),
            Text("usermail@gmail.com", style: TextStyle(fontSize: screen?w*.04:h*.04, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),
            SizedBox(height: screen ? h*.05 : w*.06,),
            Container(
              width: screen?w*.7:h*.7,
              child: PinCodeTextField(
                backgroundColor: Colors.white,
                length: 4,
                obsecureText: false,
                autoFocus: true,
                animationType: AnimationType.fade,
                shape: PinCodeFieldShape.underline,
                activeColor: Util.baseColor,
                inactiveColor: Colors.grey,
                animationDuration: Duration(milliseconds: 300),
                borderRadius: BorderRadius.circular(5),
                fieldWidth: screen?w*.1:h*.1,
                fieldHeight: h*.09,
                onChanged: (value) {

                },
              ),
            ),
            SizedBox(height: screen ? h*.09 : w*.09,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment:screen?MainAxisAlignment.spaceBetween: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text.rich(
                      TextSpan(
                    text: 'CHANGE E-MALE',
                        recognizer: new TapGestureRecognizer()..onTap = () =>print(""),
                      ),
                  style: TextStyle(fontSize: screen?w*.04:h*.04, fontFamily: 'Montserrat-Bold', color: Util.baseColor),
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'RESEND CODE',
                      recognizer: new TapGestureRecognizer()..onTap = () =>print(""),
                    ),
                    style: TextStyle(fontSize: screen?w*.04:h*.04, fontFamily: 'Montserrat-Bold', color: Util.baseColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: screen ? h*.07 : w*.08,),
            CommanButton(
              width: w*.5,
              text: 'Next',
              onPressed: (){
                NavigationRouter.switchAccountCreatedScreen(context);
              },
            ),
            SizedBox(height: screen ? 0.0 : w*.08,),
          ],
        ),
      ),
    );
  }
}
