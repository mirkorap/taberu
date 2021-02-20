import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class Money extends ValueObject {
  static const defaultCurrency = '€';
  static final currencies = ['€', r'$'].toImmutableSet();

  final Either<ValueFailure<int>, int> amount;
  final Either<ValueFailure<String>, String> currency;

  factory Money({
    @required int amount,
    String currency = defaultCurrency,
  }) {
    assert(amount != null);
    assert(currency != null);

    final validatedCurrency = validateChoice(currency, currencies);

    return Money._(
      amount: right(amount),
      currency: validatedCurrency,
    );
  }

  Money._({
    @required this.amount,
    @required this.currency,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is Money && o.amount == amount && o.currency == currency;
  }

  @override
  int get hashCode => amount.hashCode + currency.hashCode;

  @override
  String toString() => 'Money($amount, $currency)';
}
