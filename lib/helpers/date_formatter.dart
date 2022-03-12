import 'dart:convert';

import 'package:intl/intl.dart';

enum DateFormats {
  MonDDYYYY,
  fullDateText,
  fullDateAndTimeText,
  fullDateNumbers,
  DMMM,
  EE,
  EEEE,
  EEEEDMMM,
  HHMM,
}

//TODO: Локализация дат с помощью библиотеки intl: https://flutteragency.com/how-to-load-all-dart-dateformat-locale-in-flutter/
//see also https://docs.oracle.com/cd/E41183_01/DR/Date_Format_Types.html

class DateFormatter {
  static String format(DateTime? _date, {DateFormats? fmt}) {
    String res;
    DateFormats _fmt = fmt ?? DateFormats.MonDDYYYY;
    //DateTime _date = DateTime.tryParse(date);

    //TODO: eng
    if (_date == null) {
      return "";
    }

    dynamic dayData =
        '{ "1" : "Пн", "2" : "Вт", "3" : "Ср", "4" : "Чт", "5" : "Пт", "6" : "Сб", "7" : "Вс" }';
    dynamic dayDataFull =
        '{ "1" : "Понедельник", "2" : "Вторник", "3" : "Среда", "4" : "Четверг", "5" : "Пятница", "6" : "Суббота", "7" : "Воскресенье" }';
    dynamic dayDataStartingFromSunday =
        '{ "1" : "Вс", "2" : "Пн", "3" : "Вт", "4" : "Ср", "5" : "Чт", "6" : "Пт", "7" : "Сб" }';
    dynamic dayDataStartingFromSundayFull =
        '{ "1" : "Воскресенье", "2" : "Понедельник", "3" : "Вторник", "4" : "Среда", "5" : "Четверг", "6" : "Пятница", "7" : "Суббота" }';
    dynamic dayDataStartingFromSundayZero =
        '{ "0" : "Вс", "1" : "Пн", "2" : "Вт", "3" : "Ср", "4" : "Чт", "5" : "Пт", "6" : "Сб" }';
    dynamic dayDataStartingFromSundayZeroFull =
        '{ "0" : "Воскресенье", "1" : "Понедельник", "2" : "Вторник", "3" : "Среда", "4" : "Четверг", "5" : "Пятница", "6" : "Суббота" }';
    dynamic monthData =
        '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "Jun", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';
    dynamic monthDataFull =
        '{ "1" : "January", "2" : "February", "3" : "March", "4" : "April", "5" : "May", "6" : "June", "7" : "July", "8" : "August", "9" : "September", "10" : "October", "11" : "November", "12" : "December" }';

    /*
  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
    */

    switch (_fmt) {
      case DateFormats.DMMM:
        res = _date.day.toString() +
            " " +
            json.decode(monthDataFull)['${_date.month}'];
        break;
      case DateFormats.MonDDYYYY:
        res = json.decode(monthData)['${_date.month}'] +
            " " +
            _date.day.toString() +
            ", " +
            _date.year.toString();
        break;
      case DateFormats.fullDateText:
        res = json.decode(monthDataFull)['${_date.month}'] +
            " " +
            _date.day.toString() +
            ", " +
            _date.year.toString();
        break;

      case DateFormats.fullDateAndTimeText:
        res = json.decode(monthData)['${_date.month}'] +
            " " +
            _date.day.toString() +
            " " +
            _date.year.toString() +
            ", " +
            DateFormat('HH:mm').format(_date).toString();
        ;
        break;
      case DateFormats.EEEE:
        res = json.decode(dayDataStartingFromSunday)['${_date.weekday}'];
        break;
      case DateFormats.EEEE:
        res = json.decode(dayDataStartingFromSundayFull)['${_date.weekday}'];
        break;
      case DateFormats.HHMM:
        res = DateFormat('HH:mm').format(_date).toString();
        break;
      case DateFormats.EEEEDMMM:
        res = json.decode(dayDataFull)['${_date.weekday}'] +
            ', ' +
            _date.day.toString() +
            " " +
            json.decode(monthDataFull)['${_date.month}'];
        break;
      default:
        res = json.decode(monthDataFull)['${_date.month}'];
    }

    return res;
  }
}

String convertWeekdaysArrayToString(List<int> weekdaysList) {
  dynamic dayDataStartingFromSunday =
      '{ "1" : "Вс", "2" : "Пн", "3" : "Вт", "4" : "Ср", "5" : "Чт", "6" : "Пт", "7" : "Сб" }';
  dynamic dayDataStartingFromMonday =
      '{ "1" : "Пн", "2" : "Вт", "3" : "Ср", "4" : "Чт", "5" : "Пт", "6" : "Сб", "7" : "Вс" }';

  String res = "";

  for (int i = 1; i <= weekdaysList.length; i++) {
    res = res +
        json.decode(dayDataStartingFromMonday)['${weekdaysList[i - 1]}'] +
        ((i == weekdaysList.length) ? '' : ', ');
  }
  return res;
}
