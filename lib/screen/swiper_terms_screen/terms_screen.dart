import 'package:car_rental/screen/swiper_terms_screen/screens/gps_map_help_screen.dart';
import 'package:car_rental/screen/swiper_terms_screen/screens/identity_screen.dart';
import 'package:car_rental/screen/swiper_terms_screen/screens/lng_selection_widget.dart';
import 'package:car_rental/widget/information_swipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/get_started_details.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown,
//    ]);
    List<Widget> _listWidgets = [LangSelection(),IdentityScreen(),GpsMapHelpDetail(),GetStartedDetails()];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: h*.9,
        child: HeaderSection(data: _listWidgets,),
      ),
    );
  }
}
