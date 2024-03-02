class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccessState extends HomeState {}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState({required this.errMessage});
}

final class HomeLoadingState extends HomeState {}
