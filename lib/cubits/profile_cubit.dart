import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sober_app/models/profile.dart';
import 'package:sober_app/services/database.dart';

import 'states/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Database database;

  late Profile? profile; //TODO: должен быть наверное не null

  Map<String, TextEditingController> controllers = {};
  Key formKey;

  ProfileCubit(this.database)
      : formKey = GlobalKey<FormState>(),
        super(ProfileInitState()) {
    loadProfile();
  }

  //todo: move to dedicated form controller?
  void fillControllers(Profile? profile) {
    if (profile != null) {
      controllers[Profile.NAME] = TextEditingController(text: profile.name);
      controllers[Profile.USERNAME] =
          TextEditingController(text: profile.username);
      controllers[Profile.EMAIL] = TextEditingController(text: profile.email);
    }

    //todo: what if profile is null?
  }

  Future<void> loadProfile() async {
    try {
      log('fuck');
      emit(ProfileLoadingState());
      profile = await database.getProfile(); //todo: null safety!!!
      if (profile != null) {
        emit(ProfileLoadedState(profile!,
            controllers: controllers, formKey: formKey)); //todo: null safety!!!
        fillControllers(profile);
      } else {
        emit(ProfileErrorState());
      }
    } catch (e) {
      log(e.toString());
      emit(ProfileErrorState());
    }
  }

  // void updateExecutor(
  //     {String? name,
  //     String? surname,
  //     String? phone,
  //     String? email,
  //     String? avatar}) async {
  //   try {
  //     //TODO: null safety надо бы обеспечить конечно
  //     executor = executor!.copy(
  //         name: name,
  //         surname: surname,
  //         phone: phone,
  //         email: email,
  //         avatar: avatar);
  //     await database.setExecutor(executor!);
  //     emit(ExecutorLoadedState(executor!)); //TODO: null safety
  //     // await database
  //     //     .executorFuture(executorId: executorId)
  //     //     .then((executor) => emit(LoadedState(executor)));
  //   } catch (e) {
  //     emit(ExecutorErrorState());
  //   }
  // }

  void updateProfile({
    String? name,
    String? username,
    String? phone,
    String? email,
  }) {
    //todo: null safety
    Profile newProfile = profile!.copy(
      name: name,
      username: username,
      phone: phone,
      email: email,
    );

    uploadToDatabase(profile: newProfile);
  }

  //todo: remove unnecessary!
  void uploadToDatabase({Profile? profile}) async {
    //todo: null safety?
    if (profile == null) return;
    Map<String, dynamic> data = {};

    try {
      //todo: null safety?
      await database.updateProfile(data: data);
      loadProfile();
    } catch (e) {
      emit(ProfileErrorState());
    }
  }

  void createIfNew({
    String? name,
    String? username,
    String? phone,
    String? email,
  }) async {
    try {
      Profile? profile =
          await database.getProfile(); //todo: this cant's be null!

      if (profile == null) {
        Profile newProfile =
            Profile.createNew(name: name, username: username, email: email);

        await database.setProfile(data: newProfile.toMap());
        //todo: maybe load profile here?
      }
    } catch (e) {
      emit(ProfileErrorState());
      //todo: what should be emitted if error here?
    }
  }
}
