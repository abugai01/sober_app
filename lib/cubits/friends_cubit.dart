import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sober_app/models/profile.dart';
import 'package:sober_app/services/database.dart';

import 'states/friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  final Database database;

  late List<Profile> friends;

  FriendsCubit(this.database) : super(FriendsLoadingState()) {
    loadFriends();
  }

  Future<void> loadFriends() async {
    try {
      emit(FriendsLoadingState());

      List<Profile> _friends = await database.getFriendsList();
      List<String> usernames = _extractUsernames(_friends);
      //todo: think why frineds are stored like that, not in a dedicated array!

      friends = await database.getFriendsProfiles(usernames: usernames);

      log(_friends.toString());
      log(usernames.toString());
      log(friends.toString());

      emit(FriendsLoadedState(friends));
    } catch (e) {
      log(e.toString()); //todo: pull down to refresh!
      emit(FriendsErrorState());
    }
  }

  List<String> _extractUsernames(List<Profile> list) =>
      list.map((elem) => elem.username ?? '').toList();
}
