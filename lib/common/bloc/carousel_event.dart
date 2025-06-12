import 'package:equatable/equatable.dart';

abstract class CarouselEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartCarousel extends CarouselEvent {}

class NextImage extends CarouselEvent {}
