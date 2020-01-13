import 'package:car_rental/screen/auth/payment_choice.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:flutter/material.dart';


class AccountCreatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height:screen ? h*.1 : w*.1,),
            Text("Account Created!", style: TextStyle(fontSize: screen?w*.05:h*.05, color: Util.baseColor, fontFamily: 'Montserrat-Bold'),),
            SizedBox(height: h*.09,),
            Text("We have successfully verified",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize: screen?w*.03:h*.03),),
            SizedBox(height: 5,),
            Text("you'r account",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize: screen?w*.03:h*.03),),
            SizedBox(height: 10,),
            Text.rich(TextSpan(
              text: 'Username',
              children: [
                TextSpan(
                  text: ' (Email@address.com)',
                  style: TextStyle(fontSize:screen?w*.03:h*.03, color: Util.baseColor, fontFamily: 'Montserrat-Bold')
                )
              ]
            ),
              style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize: screen?w*.04:h*.04),
            ),
            SizedBox(height:screen ? h*.09 : w*.09,),

            Text("To complete the proccess of listing you'r car",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize: screen?w*.03:h*.03),),
            Text("or renting other cars, please complete he",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize:screen?w*.03:h*.03),),
            Text("financial setup",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize:screen?w*.03:h*.03),),
            SizedBox(height: screen?h*.09:w*.09,),
            CommanButton(
              width: w*.8,
              text: 'Tak me to my financial setup',
              onPressed: (){
                Navigator.push(context, Util.createRoute(page: PaymentChoice()));
              },
            ),
            SizedBox(height:screen ? h*.06 : w*.06,),

            Text("Or", style: TextStyle(color: Util.baseColor, fontSize: screen?w*.04:h*.04,fontFamily: 'Montserrat-Black'),),
            SizedBox(height:screen ? h*.03 : w*.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Skip for now",style: TextStyle(fontFamily: 'Montserrat-Black',color: Colors.grey,fontSize: screen?w*.03:h*.03),),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Util.baseColor,size: screen ? w*.08 : h*.05,),
                  onPressed: (){
//                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height:orien == Orientation.portrait ? 0.0 : w*.1,),
          ],
        ),
      ),
    );
  }
}
