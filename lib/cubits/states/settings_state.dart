import 'package:sober_app/helpers/ui_messages.dart';
import 'package:sober_app/models/streak.dart';

// I removed Equatable package on person cause I keep running into a problem comparing different objects of Streak model

abstract class SettingsState {}

class SettingsLoadingState extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  final Streak streak;

  SettingsLoadedState(this.streak);
}

class SettingsErrorState extends SettingsState {
  final String error;

  SettingsErrorState({this.error = ErrorMessages.errorGeneric});
}
