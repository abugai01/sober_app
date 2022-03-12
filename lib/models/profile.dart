import 'package:sober_app/helpers/date_calculator.dart';
import 'package:sober_app/helpers/functions.dart';

class Profile {
  static const ID = 'id';
  static const USERNAME = 'username';
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const DATE_OF_LAST_DRINK = 'dateOfLastDrink';

  String? id;
  String? username;
  String? name;
  String? email;
  DateTime? dateOfLastDrink;

  Profile({
    this.id,
    this.username,
    this.name,
    this.email,
    this.dateOfLastDrink,
  });

  //TODO: safe date extraction
  static fromMap(Map<String, dynamic>? data, String documentId) {
    return data == null
        ? null
        : Profile(
            id: documentId,
            username: data[USERNAME],
            name: data[NAME],
            email: data[EMAIL],
            dateOfLastDrink: tryExtractDate(data[DATE_OF_LAST_DRINK]),
          );
  }

  Map<String, dynamic> toMap() {
    return {
      USERNAME: username,
      NAME: name,
      EMAIL: email,
      DATE_OF_LAST_DRINK: dateOfLastDrink,
    };
  }

  //todo: think and improve
  Profile copy(
      {String? username,
      String? name,
      String? phone,
      String? email,
      DateTime? dateOfLastDrink}) {
    return Profile(
      id: this.id,
      username: (username == null || username == '') ? this.username : username,
      name: (name == null || name == '') ? this.name : name,
      email: (email == null || email == '') ? this.email : email,
      dateOfLastDrink: dateOfLastDrink ?? this.dateOfLastDrink,
    );
  }

  //TODO: на форме собирать всю инфу!!!!
  static Profile createNew({
    String? id, //todo: needed?
    String? username,
    String? name,
    String? email,
    DateTime? dateOfLastDrink,
  }) {
    return Profile(
        username: username,
        name: name,
        email: email,
        dateOfLastDrink: dateOfLastDrink);
  }

  int get sobrietyStreak => dateOfLastDrink == null
      ? 0
      : DateCalculator.calculateDifferenceInDays(dateOfLastDrink!);
  String get sobrietyStreakText => sobrietyStreak.toString();
}
