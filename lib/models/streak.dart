import 'package:sober_app/helpers/date_calculator.dart';
import 'package:sober_app/helpers/date_formatter.dart';
import 'package:sober_app/models/helpers/date_diff.dart';

class Streak {
  DateTime date;

  Streak({required this.date});

  int get streakInDays => DateCalculator.calculateDifferenceInDays(date);
  String get streakInDaysText => streakInDays.toString();
  DateDiff get dateDiff => DateCalculator.calculateDateDiff(date);

  String dateOfLastDrinkText({DateFormats? fmt}) =>
      DateFormatter.format(date, fmt: fmt);
}
