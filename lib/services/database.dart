import 'package:sober_app/models/profile.dart';
import 'package:sober_app/services/api_path.dart';
import 'package:sober_app/services/firestore_service.dart';

abstract class Database {
  Database(this.uid);

  String? uid;

  Future<Profile?> getProfile();
  Future<void> setProfile({required Map<String, dynamic> data});
  Future<void> updateProfile({required Map<String, dynamic> data});

  Future<List<Profile>> getFriendsProfiles({required List<String> usernames});
  Future<List<Profile>> getFriendsList();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase();

  late String? uid; //todo: null safety?

  final _service = FirestoreService.instance;

  @override
  Future<Profile?> getProfile() => _service.getDocument(
        path: APIPath.user(uid),
        builder: (data, documentId) => Profile.fromMap(data, documentId),
      );

  @override
  //TODO: надо бы проверять что не создаем дубли!
  //todo: auto create id or not?
  Future<void> setProfile({required Map<String, dynamic> data}) {
    return _service.setData(
      path: APIPath.user(uid),
      data: data,
    );
  }

  @override
  Future<void> updateProfile({required Map<String, dynamic> data}) {
    return _service.updateData(
      path: APIPath.user(uid),
      data: data,
    );
  }

  @override
  Future<List<Profile>> getFriendsProfiles({required List<String> usernames}) =>
      _service.getCollection(
          path: APIPath.users(),
          queryBuilder: (query) =>
              query.where(Profile.USERNAME, whereIn: usernames),
          sort: (a, b) => b.sobrietyStreak.compareTo(a.sobrietyStreak),
          builder: (data, documentId) => Profile.fromMap(data, documentId));

  @override
  Future<List<Profile>> getFriendsList() => _service.getCollection(
      path: APIPath.friends(uid),
      builder: (data, documentId) => Profile.fromMap(data, documentId));
}
