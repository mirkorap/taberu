import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_validators.dart';

class Money {
  static final currencies = ['€', r'$'].toImmutableSet();

  final Either<ValueFailure<int>, int> amount;
  final Either<ValueFailure<String>, String> currency;

  factory Money({
    @required int amount,
    @required String currency,
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
