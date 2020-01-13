import 'package:car_rental/ruotes.dart';
import 'package:car_rental/screen/auth/account_created_page.dart';
import 'package:car_rental/screen/auth/login_screen.dart';
import 'package:car_rental/screen/auth/make_choice_screen.dart';
import 'package:car_rental/screen/swiper_terms_screen/terms_screen.dart';
import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screen/swiper_terms_screen/screens/bloc_pattern/lng_change_pattern.dart';

var routes = <String, WidgetBuilder>{
  "/LoginScreen": (BuildContext context) => LoginScreen(),
  "/createProcess": (BuildContext context) => TermsPage(),
  "/MakeChoiceScreen": (BuildContext context) => MakeChoiceScreen(),
  "/AccountCreatedPage": (BuildContext context) => AccountCreatedPage(),
};
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Util.baseColor.withOpacity(0.5)
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LngChange>.value(value: LngChange()),
      ],
      child: MaterialApp(
        routes: routes,
        home: SplashScreen(),
      ),
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      NavigationRouter.switchToCreateProcess(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: w,
        height: h,
        child: Column(
          children: <Widget>[
            SizedBox(height: orien == Orientation.portrait ? h*.4 : h*.2,),
            Container(
              width: w*.3,
                child: Image.asset('assets/logo1.png',fit: BoxFit.fill,)
            ),
            SizedBox(height: orien == Orientation.portrait ? h*.4 : h*.4,),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: w*.4,
                height: orien == Orientation.portrait ? h*.05 : h*.09,
                child: Card(
                  color: Util.baseColor,
                  borderOnForeground: false,
                  elevation: 5,
                  child: Center(
                    child: Text("www.shift.com", style: TextStyle(color: Colors.white, fontSize: w*.03, fontFamily: 'Montserrat-Bold'),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
