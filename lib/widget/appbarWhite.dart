import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';

class AppBarWhiteCustom extends StatelessWidget {
  final GlobalKey<ScaffoldState> scafoldKey;
  final String title;

  const AppBarWhiteCustom({Key key, this.scafoldKey, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;

    return Column(
      children: <Widget>[
        SizedBox(
          height: screen ? h * .05 : w * .05,
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
                size: screen ? w * .08 : h * .08,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: screen ? w * .05 : h * .05,
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.white),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Container(
                    width: 40,
                    height: 35,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          child: Icon(
                            Icons.mail_outline,
                            size: 35,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.red[700],
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Image.asset(
                        'assets/images/drawer.png',
                        color: Colors.white,
                        width: screen ? w * .1 : h * .1,
                      ),
                      onTap: () {
                        scafoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: h * .06,
        ),
      ],
    );
  }
}
