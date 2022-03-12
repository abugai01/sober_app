import 'package:sober_app/models/helpers/date_diff.dart';

class DateCalculator {
  static int convertToMillisecondsSinceEpoch(DateTime dateTime) =>
      dateTime.millisecondsSinceEpoch;

  static DateTime convertToDateTime(int millisecondsSinceEpoch) =>
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

  static int calculateDifferenceInDays(DateTime start, {DateTime? end}) {
    DateTime _end = end ?? DateTime.now();

    return _end.difference(start).inDays;
  }

  //todo: unit test!
  static DateDiff calculateDateDiff(DateTime start, {DateTime? end}) {
    DateTime _end = end ?? DateTime.now();
    DateDiff diff = DateDiff.zero();

    diff.years = _end.year -
        start.year +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromMonth) ? 0 : -1);

    diff.months = _end.month -
        start.month +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromMonth)
            ? 0
            : 12) +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromDay) ? 0 : -1);

    diff.days = _end.day -
        start.day +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromDay)
            ? 0
            : daysOfPreviousMonth(_end)) +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromHour) ? 0 : -1);

    diff.hours = _end.hour -
        start.hour +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromHour) ? 0 : 24) +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromMinute)
            ? 0
            : -1);

    diff.minutes = _end.minute -
        start.minute +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromMinute)
            ? 0
            : 60) +
        (_isAfter(_end, start, mode: _DateCompareMode.startFromSecond)
            ? 0
            : -1);

    return diff;
  }

  static bool _isAfter(DateTime end, DateTime start,
      {_DateCompareMode mode = _DateCompareMode.startFromYear}) {
    switch (mode) {
      case _DateCompareMode.startFromMonth:
        return DateTime(0, end.month, end.day, end.hour, end.minute, end.second)
            .isAfter(DateTime(0, start.month, start.day, start.hour,
                start.minute, start.second));
      case _DateCompareMode.startFromDay:
        return DateTime(0, 0, end.day, end.hour, end.minute, end.second)
            .isAfter(DateTime(
                0, 0, start.day, start.hour, start.minute, start.second));
      case _DateCompareMode.startFromHour:
        return DateTime(0, 0, 0, end.hour, end.minute, end.second)
            .isAfter(DateTime(0, 0, 0, start.hour, start.minute, start.second));
      case _DateCompareMode.startFromMinute:
        return DateTime(0, 0, 0, 0, end.minute, end.second)
            .isAfter(DateTime(0, 0, 0, 0, start.minute, start.second));
      case _DateCompareMode.startFromSecond:
        return DateTime(0, 0, 0, 0, 0, end.second)
            .isAfter(DateTime(0, 0, 0, 0, 0, start.second));
      default:
        return end.isAfter(start);
    }
  }

  static int daysOfPreviousMonth(DateTime date) =>
      DateTime(date.year, date.month, 0).day;
}

enum _DateCompareMode {
  startFromYear,
  startFromMonth,
  startFromDay,
  startFromHour,
  startFromMinute,
  startFromSecond,
}
