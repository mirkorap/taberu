import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class Image extends SimpleValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Image(String path) {
    return Image._(validateImageFormat(path));
  }

  Image._(this.value);
}
