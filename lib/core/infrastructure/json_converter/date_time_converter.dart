import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, Object> {
  const DateTimeConverter();

  @override
  DateTime fromJson(Object json) {
    return DateTime.fromMillisecondsSinceEpoch(
      (json as Timestamp).millisecondsSinceEpoch,
    );
  }

  @override
  Object toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}