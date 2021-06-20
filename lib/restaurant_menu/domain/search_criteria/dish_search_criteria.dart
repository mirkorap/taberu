import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_search_criteria.freezed.dart';

@freezed
class DishSearchCriteria with _$DishSearchCriteria {
  const factory DishSearchCriteria({
    String? restaurantId,
    String? menuId,
    String? name,
  }) = _DishSearchCriteria;
}
