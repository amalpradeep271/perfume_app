import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'carousel_event.dart';
import 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final int imageCount;
  Timer? _timer;

  CarouselBloc({required this.imageCount}) : super(CarouselState(currentIndex: 0)) {
    on<StartCarousel>(_onStart);
    on<NextImage>(_onNext);

    add(StartCarousel()); // Automatically start
  }

  void _onStart(StartCarousel event, Emitter<CarouselState> emit) {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      add(NextImage());
    });
  }

  void _onNext(NextImage event, Emitter<CarouselState> emit) {
    int nextIndex = (state.currentIndex + 1) % imageCount;
    emit(state.copyWith(currentIndex: nextIndex));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
