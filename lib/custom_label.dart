import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvantageLabel extends StatelessWidget {  //reusable widget

  final String svg_img;
  final String txt;

  const AdvantageLabel({super.key, required this.svg_img, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),

      child: Container(
        width: 195,
        height: 54,

        child: Card(
          //shadowColor: Colors.black,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(svg_img),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  txt,
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
