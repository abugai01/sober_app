import 'package:flutter/material.dart';
import 'package:sober_app/models/helpers/progress.dart';
import 'package:sober_app/models/streak.dart';
import 'package:sober_app/pages/main/widgets/progress_bar.dart';

class StreakCounterV2 extends StatelessWidget {
  final Streak streak;
  //todo: conditionally show and hide year!

  const StreakCounterV2(this.streak, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Progress progress = Progress(streak);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //todo: pluralize!
          streak.dateDiff.years == 0
              ? const SizedBox()
              : ProgressBar(
                  progress: progress.years,
                  unit: 'year',
                  value: streak.dateDiff.years),
          ProgressBar(
              progress: progress.months,
              unit: 'month',
              value: streak.dateDiff.months),
          ProgressBar(
              progress: progress.days,
              unit: 'day',
              value: streak.dateDiff.days),
          ProgressBar(
              progress: progress.hours,
              unit: 'hour',
              value: streak.dateDiff.hours),
          ProgressBar(
              progress: progress.minutes,
              unit: 'minute',
              value: streak.dateDiff.minutes),
        ]);
  }
}
