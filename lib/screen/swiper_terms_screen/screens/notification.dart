import 'package:car_rental/clipper/appbar.dart';
import 'package:car_rental/screen/swiper_terms_screen/screens/notification_details.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/appbarWhite.dart';
import 'package:car_rental/widget/bottomnavigationbar.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerPage(),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Util.baseColor,
                    Util.baseColor.withOpacity(0.7),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30),
              ),
              clipper: CustomAppBarClipper(),
            ),
            AppBarWhiteCustom(
              title: "Notifications",
              scafoldKey: _scafoldKey,
            ),
            Positioned(
              top: 170,
              bottom: 0,
              child: _body(),
            )
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      width: MediaQuery.of(context).size.width,

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      "All Notifications",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 24,
                          color: Util.baseColor),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Util.baseColor,
                      size: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "*Read notifications received from Shift team and also from car renter offers, and take action.",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                    _row(flag: 0),
                    _row(showUserName: true, flag: 1),
                    _row(flag: 2)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "*Read more",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Util.baseColor,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///FLAG is used for navigation
  Widget _row({bool showUserName = false, int flag}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text.rich(TextSpan(
                text: "From Shift team",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Util.baseColor),
                children: showUserName
                    ? [
                        TextSpan(
                          text: " \"",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Util.baseColor),
                        ),
                        TextSpan(
                          text: "Username",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.yellow[700]),
                        ),
                        TextSpan(
                          text: "\"",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Util.baseColor),
                        )
                      ]
                    : [],
              )),
            ),
            Text(
              "01-01-2020\n04:00 pm",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  color: Colors.grey,
                  fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Text(
              "Subject: ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Util.baseColor),
            ),
            Text(
              "Approved car listing",
              style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  color: Colors.grey,
                  fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Text(
              "Listing number: ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Util.baseColor),
            ),
            Text(
              "216546510",
              style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  color: Colors.yellow[700],
                  decoration:
                      TextDecoration.combine([TextDecoration.underline]),
                  fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Message details",
          style: TextStyle(
              fontFamily: 'Montserrat-Bold', color: Colors.grey, fontSize: 16),
        ),
        InkWell(
          onTap: () {
            ///FLAG is used for navigation
            Navigator.push(
                context,
                Util.createRoute(
                    page: NotificationDetialsPage(
                  flag: flag,
                )));
          },
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 35,
                    color: Util.baseColor,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
