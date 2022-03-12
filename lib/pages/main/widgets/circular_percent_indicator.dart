import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sober_app/config/style.dart';
import 'package:sober_app/models/streak.dart';
import 'package:sober_app/widgets/custom_text.dart';

//todo: custom gradient?
class CircularIndicator extends StatelessWidget {
  final double percent;
  final Streak streak;
  final CircularIndicatorType type;

  const CircularIndicator(
      {required this.percent,
      required this.streak,
      this.type = CircularIndicatorType.day,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
        radius: MediaQuery.of(context).size.width * 0.36,
        //todo: pass radius from above!
        backgroundColor: themeExtraLightGrey,
        lineWidth: 22,
        percent: percent,
        //todo: separate widget
        center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                streak.streakInDaysText,
                size: 20,
                weight: FontWeight.w300,
              ),
              CustomText(
                "days",
                size: 14,
                weight: FontWeight.w300,
              ),
              const SizedBox(height: 12),
              CustomText(
                streak.dateDiff.hours.toString(),
                size: 36,
                weight: FontWeight.w300,
              ),
              CustomText(
                "hours",
                size: 14,
                weight: FontWeight.w300,
              ),
            ]),
        linearGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: _getGradientByType(type)),
        rotateLinearGradient: true,
        circularStrokeCap: CircularStrokeCap.round);
  }

  List<Color> _getGradientByType(CircularIndicatorType type) {
    switch (type) {
      case CircularIndicatorType.day:
        return const <Color>[Color(0xFF4DA0B0), Color(0xFFD39D38)];
      case CircularIndicatorType.month:
        return const <Color>[Color(0xFFFD746C), Color(0xFFFF9068)];
      case CircularIndicatorType.year:
        return const <Color>[Color(0xFF7B4397), Color(0xFFDC2430)];
      default:
        return const <Color>[Color(0xFF1AB600), Color(0xFF6DD400)];
    }
  }
}

enum CircularIndicatorType { day, month, year }
