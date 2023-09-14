import 'package:intl/intl.dart';
import 'package:mobile/app/core/values/constants.dart';

class BirthdayDate {
  final DateTime date;
  BirthdayDate({
    required this.date,
  });

  Map<String, dynamic> toJson() =>
      {keyBirthday: DateFormat('yyyy-MM-dd').format(date)};

  factory BirthdayDate.fromJson(Map<String, dynamic> map) => BirthdayDate(
        date: DateTime.parse(map[keyBirthday]),
      );
}
