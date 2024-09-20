
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.white,
      child: Center(
          child:Container( child:
          SvgPicture.asset("assets/images/sectionline.svg")
          )
      ),
    );
  }
}
