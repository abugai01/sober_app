import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sober_app/config/constants.dart';
import 'package:sober_app/helpers/date_calculator.dart';
import 'package:sober_app/models/streak.dart';
import 'package:sober_app/services/shared_prefs.dart';
import 'package:sober_app/widgets/select_date.dart';

import 'states/settings_state.dart';

//todo: rename!
class SettingsCubit extends Cubit<SettingsState> {
  late Streak streak;

  SettingsCubit() : super(SettingsLoadingState()) {
    streak = Streak(date: _getDateFromLocalStorage());
    emit(SettingsLoadedState(streak));
  }

  DateTime _getDateFromLocalStorage() {
    int? millisecondsSinceEpoch = SharedPrefs.instance
        .getInt(DATE_OF_LAST_DRINK); //todo: handle exception!
    return DateCalculator.convertToDateTime(
        millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _updateDate(DateTime? date) async {
    if (date == null) return;

    streak.date = date;
    _setDateInLocalStorage(streak.date);
    emit(SettingsLoadedState(streak));
  }

  Future<void> reset() => _updateDate(DateTime.now());

  Future<void> _setDateInLocalStorage(DateTime date) async {
    int millisecondsSinceEpoch =
        DateCalculator.convertToMillisecondsSinceEpoch(date);
    await SharedPrefs.instance
        .setInt(DATE_OF_LAST_DRINK, millisecondsSinceEpoch);
    //todo: handle exception!
  }

  Future<void> select(BuildContext context) async {
    DateTime? selectedDate = await selectDate(context,
        initialDate:
            streak.date); //todo: what if it is in the future? handle error!
    _updateDate(selectedDate);
  }
}
