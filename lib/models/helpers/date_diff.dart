class DateDiff {
  int years;
  int months;
  int days;
  int hours;
  int minutes;

  DateDiff({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
  });

  DateDiff.zero()
      : years = 0,
        months = 0,
        days = 0,
        hours = 0,
        minutes = 0;
}
