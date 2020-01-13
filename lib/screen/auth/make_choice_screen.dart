import 'package:car_rental/ruotes.dart';
import 'package:car_rental/screen/auth/login_screen.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:car_rental/widget/make_choice_screen_widget.dart';
import 'package:car_rental/widget/see_nearby_button.dart';
import 'package:flutter/material.dart';


class MakeChoiceScreen extends StatefulWidget {
  @override
  _MakeChoiceScreenState createState() => _MakeChoiceScreenState();
}

class _MakeChoiceScreenState extends State<MakeChoiceScreen> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:8.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Image.asset('assets/images/callicon.png',width: screen?w*.1:h*.1,),
                      onTap: (){
                      },
                    ),
                  ),
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
            Container(
                width:screen?w*.3:h*.3,
                child: Image.asset('assets/logo.jpeg',fit: BoxFit.fill,)),
            SizedBox(height: h*.06,),
            Text("Please Make You'r Choice", style: TextStyle(fontFamily: 'Montserrat-Bold',fontSize:screen?w*.04:h*.04),),
            SizedBox(height: 10,),
            MakeChoice(
              onTap: (){
                Navigator.of(context).push(Util.createRoute(page: LoginScreen()));
              },
              color: Util.baseColor,
              title: 'BOOK A CAR',
              hint1: 'Without referring to car rental',
              hint2: 'offices, find a car and book',
            ),
            MakeChoice(
              onTap: (){
                Navigator.of(context).push(Util.createRoute(page: LoginScreen()));
              },
              txtColor: Util.baseColor,
              color: Colors.white,
              title: 'LIST A CAR',
              hint1: "List you'r for rental share and",
              hint2: "Let it pay you'r bells",
            ),
            SizedBox(height: h*.08,),
            Text("Skip",style: TextStyle(fontFamily: 'Montserrat-Bold',fontSize: screen?w*.04:h*.04)),
            SizedBox(height: h*.1,),
            SeeNearByButton(),
          ],
        ),
      ),
      drawer: DrawerPage()
    );
  }
}
