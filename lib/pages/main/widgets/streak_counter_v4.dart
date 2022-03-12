import 'package:flutter/material.dart';
import 'package:sober_app/helpers/date_formatter.dart';
import 'package:sober_app/models/streak.dart';
import 'package:sober_app/widgets/custom_text.dart';

class StreakCounterV4 extends StatelessWidget {
  final Streak streak;

  const StreakCounterV4(this.streak, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomText("I've been sober since",
              weight: FontWeight.w200, size: 16, color: Colors.grey),
          const SizedBox(height: 36),
          CustomText(streak.dateOfLastDrinkText(fmt: DateFormats.fullDateText),
              weight: FontWeight.w300, align: TextAlign.center, size: 36),
          const SizedBox(height: 16),
          //todo: aM pm
          CustomText(streak.dateOfLastDrinkText(fmt: DateFormats.HHMM),
              weight: FontWeight.w300, align: TextAlign.center, size: 16),
        ]);
  }
}
