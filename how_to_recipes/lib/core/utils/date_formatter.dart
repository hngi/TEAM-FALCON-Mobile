import 'package:jiffy/jiffy.dart';

String convertDateFromString(String strDate) {
  DateTime todayDate;

  if (strDate == null) {
    todayDate = DateTime.now();
  } else
    todayDate = DateTime.parse(strDate);
  return Jiffy(todayDate).yMMMEd;
}

bool checkDay(String date) {
  DateTime givenDate = DateTime.parse(date);
  DateTime todayDate = DateTime.now();

  if (givenDate.day == todayDate.day) {
    print("found");
    return true;
  }
  return false;
}
