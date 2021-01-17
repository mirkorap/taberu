import 'package:dartz/dartz.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';

class Image {
  final Either<ValueFailure<String>, String> value;

  factory Image(String path) {
    assert(path != null);

    return Image._(validateImageFormat(path));
  }

  Image._(this.value);
}
