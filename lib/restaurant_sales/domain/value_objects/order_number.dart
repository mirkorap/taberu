import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class OrderNumber extends SimpleValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory OrderNumber(int orderNumber) {
    return OrderNumber._(validateGreaterOrEqualThan(orderNumber, 0));
  }

  factory OrderNumber.fromString(String orderNumberStr) {
    final regex = RegExp(r"([.]*0)(?!.*\d)");
    final orderNumber = int.parse(orderNumberStr.replaceAll(regex, ''));

    return OrderNumber(orderNumber);
  }

  OrderNumber._(this.value);

  @override
  String toString() {
    return value.toString().padLeft(9, '0');
  }
}
