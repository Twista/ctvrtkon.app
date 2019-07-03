DateTime stringToDateTime(String d) {
  var dateString = "${d.substring(6, 10)}-${d.substring(3, 5)}-${d.substring(0, 2)}T${d.substring(11, 16)}:00Z";
  print(dateString);
  try {
    return DateTime.parse(dateString);

  } on Exception catch (e) {
    // todo LOG
    print(e);
    return null;
  }
}
