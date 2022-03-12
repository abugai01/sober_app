import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sober_app/helpers/ui_messages.dart';
import 'package:sober_app/models/profile.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
//todo: find out why this is needed (if needed at all)
}

//todo: separate independent form controller?
class ProfileLoadedState extends ProfileState {
  final Profile profile;
  final Map<String, TextEditingController> controllers;
  final Key formKey;

  ProfileLoadedState(this.profile,
      {required this.controllers, required this.formKey});

  @override
  List<Object> get props => [profile, controllers];
}

// class FormGenericState extends CustomFormState {
//   final Map<String, TextEditingController> controllers;
//   final Key formKey;
//
//   FormGenericState({
//     required this.controllers,
//     required this.formKey,
//   });
//
//   @override
//   List<Object> get props => [controllers];
// }

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState({this.error = ErrorMessages.errorGeneric});

  @override
  List<Object> get props => [];
}
