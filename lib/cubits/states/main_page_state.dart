import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {}

class MainPageGenericState extends MainPageState {
  final int version;

  MainPageGenericState({this.version = 1});

  @override
  List<Object> get props => [version];
}
