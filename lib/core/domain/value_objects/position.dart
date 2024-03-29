import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class Position extends ValueObject {
  final Either<ValueFailure<double>, double> longitude;
  final Either<ValueFailure<double>, double> latitude;

  factory Position({
    required double longitude,
    required double latitude,
  }) {
    return Position._(
      longitude: right(longitude),
      latitude: right(latitude),
    );
  }

  Position._({
    required this.longitude,
    required this.latitude,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is Position && o.longitude == longitude && o.latitude == latitude;
  }

  @override
  int get hashCode => longitude.hashCode + latitude.hashCode;

  @override
  String toString() => 'Position($longitude, $latitude)';
}
