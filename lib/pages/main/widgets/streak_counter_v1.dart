import 'package:flutter/material.dart';
import 'package:sober_app/helpers/functions.dart';
import 'package:sober_app/models/streak.dart';
import 'package:sober_app/widgets/custom_text.dart';

class StreakCounterV1 extends StatelessWidget {
  final Streak streak;

  const StreakCounterV1(this.streak, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomText("Sober",
              weight: FontWeight.w200, size: 28, color: Colors.grey),
          const SizedBox(height: 32),
          CustomText(streak.streakInDaysText,
              weight: FontWeight.w200, align: TextAlign.center, size: 120),
          CustomText(
              pluralize(
                  'day',
                  streak
                      .streakInDays), //todo: convert 396 days in 1 year 1 month 1 day
              weight: FontWeight.w400,
              size: 24)
        ]);
  }
}
