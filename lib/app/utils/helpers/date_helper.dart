/// Find the yesterday which contains the provided date.
DateTime findYesterday(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.day));
}
/// Find the first date of the week which contains the provided date.
DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday));
}
/// Find last date of the week which contains provided date.
DateTime findLastDateOfTheWeek(DateTime dateTime) {
  return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
}

