String pluralize(String word, int count) {
  if (count == 1) {
    return word;
  } else {
    return word + 's';
  }
}

DateTime? tryExtractDate(dynamic arg) {
  if (arg == null) return null;

  DateTime? res;

  try {
    res = arg.toDate();
  } on NoSuchMethodError {
    res = DateTime.parse(arg);
  } catch (e) {
    print(e.toString());
    return null;
  }

  return res;
}

String makeSubstring(String string, {int length = 35, String ending = '...'}) {
  if (string.length > length) {
    return string.substring(0, length) + ending;
  } else {
    return string;
  }
}
