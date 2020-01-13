import 'package:car_rental/model/swiper_model.dart';
import 'package:car_rental/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HeaderSection extends StatelessWidget {
  final List<Widget> data;
  HeaderSection({@required this.data});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Swiper(
      autoplayDisableOnInteraction: false,
      autoplay: false,
      loop: false,
      itemBuilder: (context, index) {
        return data[index];
      },
      itemCount: data.length,
//      control: new SwiperControl(
//        color: Util.baseColor,
//        disableColor: Colors.transparent,
//        padding: EdgeInsets.only(top: h*.9, right: 40, left: 40)
//      ),
      pagination: new SwiperPagination(
          margin: new EdgeInsets.all(5.0),
          builder: new DotSwiperPaginationBuilder(
              color: Colors.grey, activeColor: Colors.red)),
    );
  }
}
