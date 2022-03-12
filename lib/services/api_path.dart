class APIPath {
  static String users() => 'users';
  static String user(String? uid) => 'users/$uid';
  static String friends(String? uid) => 'users/$uid/friends';
}
