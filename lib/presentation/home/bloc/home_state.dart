import 'package:perfume_app/domain/home/entities/home_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeEntity homeEntity;

  HomeLoaded(this.homeEntity);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
