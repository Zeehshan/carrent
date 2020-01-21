import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/appbar.dart';
import 'package:car_rental/widget/bottomnavigationbar.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:flutter/material.dart';

class RefundPage extends StatefulWidget {
  @override
  _RefundPageState createState() => _RefundPageState();
}

class _RefundPageState extends State<RefundPage> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerPage(),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBarCustom(
              scafoldKey: _scafoldKey,
              title: "Refunds",
            ),
            _heading("Refunds Count  "),
            SizedBox(
              height: 20,
            ),
            _item(),
            SizedBox(
              height: 10,
            ),
            _item(showToggle: true),
            SizedBox(
              height: 30,
            ),
            _heading("Cancelled Count  "),
            Center(
              child: Text(
                "System Auto Cancelled \"Dure to no response\"",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat-Bold',
                    color: Colors.grey),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            _item(),
            SizedBox(height: 10,),
            _item(showToggle: true),
          ],
        ),
      ),
    );
  }

  _heading(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 30 + 15.0),
      child: Text.rich(TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat-Bold',
            color: Colors.yellow[700],
          ),
          children: [
            TextSpan(
              text: '(',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat-Bold',
                  color: Colors.grey),
            ),
            TextSpan(
              text: "3",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat-Bold',
                  color: Colors.black),
            ),
            TextSpan(
              text: ')',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat-Bold',
                  color: Colors.grey),
            ),
          ])),
    );
  }

  _item({bool showToggle = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: "UserName - Date ",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat-Bold',
                        color: Util.baseColor),
                    children: [
                      TextSpan(
                        text: '(',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.grey),
                      ),
                      TextSpan(
                        text: "01/01/2020",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: ')',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Listed car details",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.black,
                ),
              ),
              showToggle
                  ? Icon(
                      Icons.keyboard_arrow_down,
                      color: Util.baseColor,
                      size: 35,
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
