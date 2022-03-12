import 'package:flutter/material.dart';
import 'package:sober_app/config/style.dart';
import 'package:sober_app/helpers/functions.dart';

//todo: looking bad for 1 minute! maybe move to package
class ProgressBar extends StatelessWidget {
  final Color color; //todo: gradient and different colors!
  final num progress;
  final String unit;
  final int value;

  const ProgressBar(
      {this.color = Colors.lightGreenAccent,
      required this.progress,
      required this.unit,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 18;

    double width = MediaQuery.of(context).size.width * 0.84;
    double height = MediaQuery.of(context).size.height * 0.06;

    double innerContainerWidth = width * progress.clamp(0, 1);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: themeUltraLightGrey,
        ),
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: innerContainerWidth,
              height: height,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(Radius.circular(borderRadius)),
                color: color,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    text: value.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ' + pluralize(unit, value),
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Colors.black)),
                    ],
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
