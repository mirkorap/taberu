import 'package:dartz/dartz.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_validators.dart';

class Image {
  final Either<ValueFailure<String>, String> value;

  factory Image(String imagePath) {
    assert(imagePath != null);

    return Image._(validateImageFormat(imagePath));
  }

  Image._(this.value);
}
