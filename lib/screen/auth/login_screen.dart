
import 'package:car_rental/screen/auth/email_verified_page.dart';
import 'package:car_rental/screen/auth/signup_screen.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:car_rental/widget/see_nearby_button.dart';
import 'package:car_rental/widget/social_widget.dart';
import 'package:car_rental/widget/text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scafoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height:screen ? h*.04 : h*.08,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Util.baseColor,size: screen ? w*.08 : w*.05,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 5,),
                  Text("Login", style: TextStyle(fontSize:screen?w*.05:h*.05, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),
                  Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Image.asset('assets/images/drawer.png',width:screen?w*.1:h*.1,),
                      onTap: (){
                        _scafoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("Welcome back!", style: TextStyle(fontSize: screen?w*.06:h*.06, color: Util.baseColor, fontFamily: 'Montserrat-Bold'),),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:screen?w*.1:h*.1),
              child: CustomTextFieldWidget(
                labelText: 'E-mail address',
                hintText: 'email will here',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen?w*.1:h*.1),
              child: CustomTextFieldWidget(
                labelText: 'Password',
                hintText: 'password will here',
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(right: screen?w*.1:h*.1),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text.rich(
                  TextSpan(
                      text: "Forgot Password?",
                    recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                  ),
                  style: TextStyle(decoration: TextDecoration.underline, fontSize: screen?w*.03:h*.03,color: Util.baseColor,fontFamily: 'Montserrat-Bold'),
                ),
              ),
            ),
            SizedBox(height:screen?h*.09:w*.09,),
            CommanButton(
              text: 'Login',
              onPressed: (){
                Navigator.push(context, Util.createRoute(page: EmailVerifiedPage()));
              },
            ),
            SizedBox(height: screen?h*.09:w*.09,),
            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                children: [
                  TextSpan(
                    text: "Sign Up",style: TextStyle(decoration: TextDecoration.underline),
                    recognizer: new TapGestureRecognizer()..onTap = () => Navigator.of(context).push(Util.createRoute(page: SignUpPage())),
                  ),
                ]
              ),
              style: TextStyle(fontSize: screen?w*.04:h*.04,color: Util.baseColor,fontFamily: 'Montserrat-Bold'),
            ),
            SizedBox(height: 20,),
            Text("Or", style: TextStyle(color: Util.baseColor, fontSize: screen?w*.04:h*.04,fontFamily: 'Montserrat-Bold'),),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                SocialButton(id: 1,
                  text: 'SIGN IN USING',
                  onPressed: (){},
                ),
                Spacer(),
                SocialButton(id: 2,text:
                'SIGN IN USING',
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(height: screen?h*.05:w*.05,),
            SeeNearByButton(),
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}
