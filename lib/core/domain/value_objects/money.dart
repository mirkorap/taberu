import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';

class Money {
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
}
