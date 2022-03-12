import 'package:equatable/equatable.dart';
import 'package:sober_app/helpers/ui_messages.dart';
import 'package:sober_app/models/profile.dart';

abstract class FriendsState extends Equatable {}

class FriendsLoadingState extends FriendsState {
  @override
  List<Object> get props => [];
}

class FriendsLoadedState extends FriendsState {
  final List<Profile> friends;

  FriendsLoadedState(this.friends);

  @override
  List<Object> get props => [friends];
}

class FriendsErrorState extends FriendsState {
  final String error;

  FriendsErrorState({this.error = ErrorMessages.errorGeneric});

  @override
  List<Object> get props => [];
}
