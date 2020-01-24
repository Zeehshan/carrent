import 'package:car_rental/widget/bottomnavigationbar.dart';
import 'package:car_rental/widget/calender_picker.dart';
import 'package:car_rental/widget/comman_button.dart';
import 'package:car_rental/widget/custom_dropdown.dart';
import 'package:car_rental/widget/drawer.dart';
import 'package:car_rental/widget/text_field_widget.dart';
import 'package:car_rental/widget/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:car_rental/utils/util.dart';
import 'package:car_rental/widget/appbarWhite.dart';
import 'package:car_rental/clipper/appbar.dart';

class ListYourCarPage extends StatefulWidget {
  @override
  _ListYourCarPageState createState() => _ListYourCarPageState();
}

class _ListYourCarPageState extends State<ListYourCarPage> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  List<String> stepperText = [
    "Details",
    "Pictures",
    "Documents",
    "Availability",
    "GPS",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scafoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      drawer: DrawerPage(),
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Util.baseColor,
                  Util.baseColor.withOpacity(0.7),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(child: _stepper()),
            ),
            clipper: CustomAppBarClipper(),
          ),
          AppBarWhiteCustom(
            title: "List Your Car",
            scafoldKey: _scafoldKey,
          ),
          Positioned(top: 220, bottom: 60, child: _checkStepperSelection()),
          Positioned(
            bottom: 8,
            right: 5,
            left: 5,
            child: _bottomButtonSelection(),
          ),
        ],
      ),
    );
  }

  _stepper() {
    Color color = Util.baseColor;

    return Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.maxFinite,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
            ),
          ),
        ),
        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: stepperText
                  .map((text) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = stepperText.indexOf(text);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              (stepperText.indexOf(text) % 2) == 0 ? "" : text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Montserrat-Bold',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: color,
                                  border:
                                      stepperText.indexOf(text) == currentIndex
                                          ? Border.all(
                                              color: Colors.white, width: 4)
                                          : null,
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              (stepperText.indexOf(text) % 2) != 0 ? "" : text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Montserrat-Bold',
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList()),
        )
      ],
    );
  }

  bool stepOnePartTwo = false;
  bool stepFivePartTwo = false;

  _checkStepperSelection() {
    switch (currentIndex + 1) {
      case 1:
        return stepOnePartTwo ? _stepOnePart2() : _stepOne();
        break;
      case 2:
        return _stepTwo();
        break;
      case 3:
        return _stepThree();
        break;
      case 4:
        return _stepFour();
        break;
      case 5:
        return stepFivePartTwo ? _stepFivePart2() : _stepFive();
        break;
    }
  }

  _bottomButtonSelection() {
    switch (currentIndex + 1) {
      case 1:
        return stepOnePartTwo
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CommanButton(
                    text: 'Next',
                    onPressed: () {
                      setState(() {
                        currentIndex++;
                      });
                    },
                  ),
                ],
              )
            : InkWell(
                onTap: () {
                  setState(() {
                    stepOnePartTwo = true;
                  });
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "*Goto car options & condition",
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
                ),
              );
        break;
      case 2:
        return _bottomBackAndNext();
        break;
      case 3:
        return _bottomBackAndNext();
        break;
      case 4:
        return _bottomBackAndNext();
        break;
      case 5:
        return stepFivePartTwo
            ? Row(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex--;
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Util.baseColor,
                        size: 30,
                      )),
                ],
              )
            : Row(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex--;
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Util.baseColor,
                        size: 30,
                      )),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        stepFivePartTwo = true;
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          "*Goto car return location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: 'Montserrat-Bold',
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Util.baseColor,
                        ),
                      ],
                    ),
                  )
                ],
              );
        break;
    }
  }

  _stepOne() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              headingText("Car Details"),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                      text: "Default deposit Financial account ",
                      style: TextStyle(
                        color: Colors.yellow[800],
                        fontSize: size.shortestSide * 0.032,
                        fontFamily: 'Montserrat-Bold',
                      ),
                      children: [
                        TextSpan(
                            text: " Change here",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: size.shortestSide * 0.032,
                                fontFamily: 'Montserrat-Bold',
                                decoration: TextDecoration.combine(
                                    [TextDecoration.underline]))),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Brand Name",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Model/ Series",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Year",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Engine Type",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Seats",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Vehicle type",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Kilometer (ODO)",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Transmission",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Car Color",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Chassis No.",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Is Licensed?",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Fully Insuranced?",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Renting Price",
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Expanded(
                    child: CustomDropDown(
                      onChangeFun: (val) {},
                      listData: ["-"],
                      hintText: "Currency",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _stepOnePart2() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: headingText("Options & Condition"),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    stepOnePartTwo = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "*Back to details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      size: 30,
                      color: Util.baseColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Air Condition",
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Navigation Screen",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Cruise Control",
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Mobile USB",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Sunroof",
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Child Seat",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Electrical Windows",
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Heated Seats",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "RPM Guage",
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Chassis No.",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "ABS",
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: CustomDropDown(
                            onChangeFun: (val) {},
                            listData: ["-"],
                            hintText: "Audio System",
                          ),
                        ),
                      ],
                    ),
                    CustomTextFieldWidget(
                      labelText: 'Condition & Status',
                      hintText: 'Condition & Status',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _stepTwo() {
    Size size = MediaQuery.of(context).size;
    Orientation ori = MediaQuery.of(context).orientation;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  headingText("Car Pictures"),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "*Add photo and one Thumbnail",
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontFamily: 'Montserrat-Bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 30),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: ori == Orientation.portrait ? 1.0 : 1.4,
                    crossAxisSpacing: size.width * 0.1,
                    mainAxisSpacing: size.longestSide * 0.03),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: size.longestSide * 0.1,
                          color: Util.baseColor,
                        ),
                        Text(
                          "Add Photo",
                          style: TextStyle(
                            color: Util.baseColor,
                            fontSize: size.longestSide * 0.025,
                            fontFamily: 'Montserrat-Bold',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> imageAddAtStepThree = [
    "Add You'r Identity",
    "Add Car Licenses",
    "Add Driver Licenses",
    "Add Car Insurance",
  ];

  _stepThree() {
    Size size = MediaQuery.of(context).size;
    Orientation ori = MediaQuery.of(context).orientation;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              headingText("Documents"),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: <Widget>[
                    Text.rich(TextSpan(
                        text:
                            "Add the copy images of your documents, these docuements are ",
                        style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.grey,
                            fontSize: 14),
                        children: [
                          TextSpan(
                            text: "for shift review only",
                            style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                color: Util.baseColor,
                                fontSize: 14),
                          ),
                          TextSpan(
                            text: " and ",
                            style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                color: Colors.grey,
                                fontSize: 14),
                          ),
                          TextSpan(
                            text: "will not be displayed in your car listing.",
                            style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                color: Util.baseColor,
                                fontSize: 14),
                          ),
                        ])),
                    SizedBox(
                      height: 30,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              ori == Orientation.portrait ? 1.0 : 1.4,
                          crossAxisSpacing: size.width * 0.1,
                          mainAxisSpacing: size.longestSide * 0.03),
                      itemCount: imageAddAtStepThree.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                size: size.longestSide * 0.1,
                                color: Util.baseColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  imageAddAtStepThree[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Util.baseColor,
                                    fontSize: size.longestSide * 0.025,
                                    fontFamily: 'Montserrat-Bold',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _stepFour() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                headingText("Availability"),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "*Fill dates and times for "
                        "renting period, and also fill the"
                        " response time to renters clients offers,"
                        " sticking to dates credits you profile rating.",
                        style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.grey,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Car Pickup",
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Bold',
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Expanded(
                            child: Text(
                              "Car Return",
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Bold',
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CalenderPickerField(
                              onClick: () {},
                              text: "Pickup date (from)",
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Expanded(
                            child: CalenderPickerField(
                              onClick: () {},
                              text: "Return date (from)",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TimePickerField(
                              onClick: () {},
                              text: "Pickup time",
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Expanded(
                            child: TimePickerField(
                              onClick: () {},
                              text: "Return time",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Response to offers",
                        style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomDropDown(
                              onChangeFun: (val) {},
                              listData: ["-"],
                              hintText: "Within TIme",
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ));
  }

  _stepFive() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              headingText("Car Location"),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "*Use map to select location of pickup and return",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomDropDown(
                            hintText: "Country",
                            listData: ["-"],
                            onChangeFun: (val) {},
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: CustomDropDown(
                            hintText: "City",
                            listData: ["-"],
                            onChangeFun: (val) {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pickup Location",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 150,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text("Map"),
                      ),
                    ),
                  ],
                ),
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

  _stepFivePart2() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    stepFivePartTwo = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "*Back to pickup location",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      size: 30,
                      color: Util.baseColor,
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "*Use map to select location of pickup and return",
                        style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.grey,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Return Location",
                        style: TextStyle(
                            fontFamily: 'Montserrat-Bold',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 150,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text("Map"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommanButton(
                  text: 'Submit',
                  onPressed: _showDialog,
                  width: double.maxFinite,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headingText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'calibrib.ttf',
          fontWeight: FontWeight.w900,
          fontSize: 24,
          color: Util.baseColor),
    );
  }

  _bottomBackAndNext() {
    return Row(
      children: <Widget>[
        InkWell(
            onTap: () {
              setState(() {
                currentIndex--;
              });
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Util.baseColor,
              size: 30,
            )),
        Spacer(),
        CommanButton(
          text: 'Next',
          onPressed: () {
            setState(() {
              currentIndex++;
            });
          },
        ),
      ],
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return DialogSubmissionSuccessful();
        });
  }
}

class DialogSubmissionSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Text(
                  "Submission Successful!",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Black',
                      fontSize: 24,
                      color: Util.baseColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "You will recive notification message"
                  " through Shift once our team review you'r"
                  " listing in less than 24 hours.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Listing Number",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Black',
                      fontSize: 22,
                      color: Util.baseColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "18354645",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "You'r still able to edit you'r listing, before we approve it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Bold',
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CommanButton(
                  text: 'Yes, edit my car listing',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: MediaQuery.of(context).size.width * .6,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Black',
                          fontSize: 20,
                          decoration: TextDecoration.combine(
                              [TextDecoration.underline]),
                          color: Util.baseColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
