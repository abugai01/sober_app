import 'package:sober_app/helpers/date_calculator.dart';
import 'package:sober_app/models/streak.dart';

class Progress {
  final Streak _streak;

  Progress(Streak streak) : _streak = streak;

  double get years => _streak.dateDiff.years == 0 ? 0 : 1;
  double get months => _streak.dateDiff.months / 12;
  double get days =>
      _streak.dateDiff.days /
      DateCalculator.daysOfPreviousMonth(DateTime.now());
  double get hours => _streak.dateDiff.hours / 24;
  double get minutes => _streak.dateDiff.minutes / 60;
}
