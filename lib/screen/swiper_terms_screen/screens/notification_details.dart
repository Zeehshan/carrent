import 'package:car_rental/clipper/appbar.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/appbarWhite.dart';
import 'package:car_rental/widget/bottomnavigationbar.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:flutter/material.dart';

class NotificationDetialsPage extends StatefulWidget {
  final int flag;

  const NotificationDetialsPage({Key key, this.flag}) : super(key: key);

  @override
  _NotificationDetialsPageState createState() =>
      _NotificationDetialsPageState();
}

class _NotificationDetialsPageState extends State<NotificationDetialsPage> {
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
                      "Message Details",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 24,
                          color: Util.baseColor),
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
                      "*Read notifications received from "
                      "Shift team and also from car renter offers, and take action.",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                    _row(),
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

  Widget _row() {
    Size size = MediaQuery.of(context).size;
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
                children: widget.flag == 2
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
        SizedBox(
          height: size.height * 0.14,
        ),
        Column(
          children: <Widget>[
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
        SizedBox(
          height: size.height * 0.03,
        ),
        Center(
          child: widget.flag != 2
              ? Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: Text(
                    "Close",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Util.baseColor,
                        fontFamily: 'Montserrat-Bold',
                        decoration:
                            TextDecoration.combine([TextDecoration.underline])),
                  ))
              : CommanButton(
                  text: 'Accept Renting Request',
                  onPressed: () {},
                  width: size.width * 0.6,
                ),
        ),
      ],
    );
  }
}
