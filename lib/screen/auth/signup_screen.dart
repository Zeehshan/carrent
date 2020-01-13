import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:car_rental/widget/social_widget.dart';
import 'package:car_rental/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  Country _selected;
  @override
  Widget build(BuildContext context) {
    List<String> _list = <String>['LOGIN WITH FACEBOOK', 'LOGIN WITH GOOGLE'];
    List<String> _icon = <String>['assets/fb1.png','assets/googleicon.png'];
    List<Color> _colorIcon = <Color>[Colors.white, Colors.grey];
    List<Color> _colorSocialButon = <Color>[Color.fromRGBO(29, 39, 125, 1.0), Colors.white];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    double vertical = orien == Orientation.portrait ? h*.004 : w*.02;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scafoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height:orien == Orientation.portrait ? h*.04 : h*.08,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Util.baseColor,size: screen?w*.08:h*.08,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 5,),
                  Text("Sign Up", style: TextStyle(fontSize:screen?w*.05:h*.04, fontFamily: 'Montserrat-Bold', color: Util.baseColor),),
                  Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Image.asset('assets/images/drawer.png',width: screen?w*.1:h*.1,),
                      onTap: (){
                        _scafoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: vertical),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: CustomTextFieldWidget(
                      labelText: 'First name',
                      hintText: 'first name here',
                    ),
                  ),
                  SizedBox(width: 20,),
                  Flexible(
                    child: CustomTextFieldWidget(
                      labelText: 'Last name',
                      hintText: 'last name here',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: vertical),
              child: CustomTextFieldWidget(
                labelText: 'E-mail address',
                hintText: 'email will here',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: vertical),
              child: CustomTextFieldWidget(
                labelText: 'Username',
                hintText: 'username will here',
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: vertical),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("   ${_selected?.name ?? "Country"}",style: TextStyle(fontSize: screen?w*.04:h*.04,fontFamily: 'Montserrat-Bold',color: Colors.grey,height:_selected?.name == null ? .09 : 1.0)),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CountryPicker(
                            showDialingCode: false,
                            onChanged: (Country country) {
                              setState(() {
                                _selected = country;
                              });
                            },
                            showFlag: false,
                            showName: false),
                      ),
                    ],
                  ),
                  SizedBox(height: screen?h*.02:w*.02,),
                  Container(
                    height: 1,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                width: screen?w*.5:h*.5,
                child: CustomTextFieldWidget(
                  labelText: 'Phone number',
                  hintText: '+1 - ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: vertical),
              child: CustomTextFieldWidget(
                labelText: 'Password',
                hintText: 'password will here',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: vertical),
              child: CustomTextFieldWidget(
                labelText: 'Confirm password',
                hintText: 'reenter password',
              ),
            ),
            SizedBox(height:screen?h*.03:w*.04,),
            CommanButton(
              width: w*.5,
              text: 'Next',
            ),
            SizedBox(height:screen?h*.02:w*.03,),
            Text("Or", style: TextStyle(color: Util.baseColor, fontSize: screen?w*.04:h*.04,fontFamily: 'Montserrat-Bold'),),
            SizedBox(height:screen?h*.02:w*.03,),
            Column(
              children: List.generate(2, ((index){
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: w*.7,
                  height: screen?h*.06:w*.06,
                  decoration: BoxDecoration(
                    color: _colorSocialButon[index],
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(_icon[index],color: _colorIcon[index],width: screen?(index==1 ? w*.05 : w*.06):(index==1 ? h*.05 : h*.06),),
                      SizedBox(width: 4,),
                      Text(_list[index],style: TextStyle(color: _colorIcon[index],fontSize:screen?w*.03:h*.03, fontFamily: 'Montserrat-Bold')),
                    ],
                  ),
                );
              }))
            )
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}
