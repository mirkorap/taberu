part of 'menu_navigation_cubit.dart';

@freezed
abstract class MenuNavigationState with _$MenuNavigationState {
  const factory MenuNavigationState.initial() = _Initial;

  const factory MenuNavigationState.loadInProgress() = _LoadInProgress;

  const factory MenuNavigationState.loadSuccess(KtList<Menu> menus) = _LoadSuccess;

  const factory MenuNavigationState.loadFailure(MenuFailure failure) = _LoadFailure;
}
