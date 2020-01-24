import 'package:car_rental/screen/auth/payment_choice.dart';
import 'package:car_rental/screen/my_info/my_info.dart';
import 'package:car_rental/screen/swiper_terms_screen/screens/listyourcar.dart';
import 'package:car_rental/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> _options = <Data>[
      Data("My Information",(){
        Navigator.push(context, Util.createRoute(page: MyInfoPage()));
      }),Data("My Financial Setup",(){
        Navigator.push(context, Util.createRoute(page: PaymentChoice()));
      }),
      Data("My Listed Cars",(){}),Data("My Rented Cars",(){}),Data("My Financial Transaction",(){})];
    List<Data> _options2 = <Data>[
      Data("Who we are",(){print("okok");}),Data("Terms of services",(){}),Data("Our privacy policy",(){}),
      Data("Contact Us",(){})];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    Widget _CustomText(text,{bool fontWieghtNormal=false}){
      return Padding(
        padding:EdgeInsets.only(left: 20),
        child: Text(
            text,
            style: TextStyle(
                fontFamily: 'BAUHAUSM.TTF',
                fontSize: screen?w*.03:h*.03,
                color: Colors.white,
                fontWeight: fontWieghtNormal ? FontWeight.normal : FontWeight.bold)),
      );
    }
    return Container(
      height: h,
      width: w*.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Util.baseColor,Util.baseColor]
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: h*.05,),
          Container(
            width: w*.8,
//            padding: EdgeInsets.all(screen? w*.03 : h*.03),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: l/12,
                      height: l/12,
                      color: Colors.grey,
                      child: Center(
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.only(top: screen ? h*.06 : w*.06),
                    child: InkWell(
                      child: Icon(Icons.edit, size: screen?w*.04:h*.04),
                    ),
                  ),
                  SizedBox(width: screen?w*.04:h*.04,),
                  Padding(
                    padding: EdgeInsets.only(bottom: h*.04),
                    child: Text("Username", style: TextStyle(fontFamily: 'Montserrat-Bold',fontSize: screen?w*.04:h*.04,color: Colors.white),),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(top: h*.06,right: 14),
                      width: screen ?w*.3:h*.3,
                      child: Image.asset('assets/wlogo.png',fit: BoxFit.fill,)
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1.5,
            color: Colors.white,

          ),
      Flexible(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _CustomText("Home"),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: _CustomText("Change Language"),
                  ),
                ],
              ),
              SizedBox(height: screen?h*.02 : w*.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _CustomText("How it works"),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.message, size: screen?w*.08:h*.08,color: Colors.white,),
                        ),
                        Positioned(
                          right: w*.0009,
                          top: -h*.01,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                           decoration: BoxDecoration(
                             color: Colors.red,
                             borderRadius: BorderRadius.circular(100)
                           ),
                            child: Center(child: Text("2",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screen?h*.02 : w*.02,),
              _CustomText("My Profile",fontWieghtNormal: true),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(_options.length, ((index){
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: _options[index].onTap,
                      child: Container(
                        width: w,
                        padding:EdgeInsets.symmetric(vertical:6),
                        child: _CustomText(_options[index].text),
                      ),
                    ),
                  );
                })),
              ),
              SizedBox(height: screen?h*.02 : w*.02,),
              _CustomText("Go To",fontWieghtNormal: true),
              SizedBox(height: screen?h*.005 : w*.005,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _CustomText("Book a car(rent)"),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.add, color: Colors.white,size: screen?w*.08:h*.08,),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screen?h*.004 : w*.004,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    print("okokok");
                    Navigator.pop(context);
                    Navigator.push(context, Util.createRoute(page: ListYourCarPage()));
                  },
                  splashColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _CustomText("List My Car"),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.search, color: Colors.white,size: screen?w*.08:h*.08,),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screen?h*.03 : w*.03,),
              _CustomText("About Us",fontWieghtNormal: true),
              SizedBox(height: screen?h*.02 : w*.02,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(_options2.length, ((index){
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: _options2[index].onTap,
                      child: Container(
                        width: w,
                        padding:EdgeInsets.symmetric(vertical:6),
                        child: _CustomText(_options2[index].text),
                      ),
                    ),
                  );
                })),
              ),
              SizedBox(height: screen?h*.01 : w*.01,),
              _CustomText("Support",fontWieghtNormal: true),
              SizedBox(height: 5,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _CustomText("Get instance Support"),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: screen?w*.1:h*.1,
                          child: Image.asset('assets/supporticon.png',))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}

class Data{
  final String text;
  final GestureTapCallback onTap;

  Data(this.text, this.onTap);
}
