import 'package:dartz/dartz.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:uuid/uuid.dart';

class UniqueId {
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
