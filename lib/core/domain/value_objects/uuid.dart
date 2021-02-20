import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';
import 'package:uuid/uuid.dart';

@immutable
class UniqueId extends SimpleValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);

    return UniqueId._(right(uniqueId));
  }

  UniqueId._(this.value);
}
