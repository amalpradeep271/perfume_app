import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfume_app/domain/home/usecases/get_home_data_usecase.dart';
import 'package:perfume_app/presentation/home/bloc/home_event.dart';
import 'package:perfume_app/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUsecase getHomeDataUsecase;

  HomeBloc(this.getHomeDataUsecase) : super(HomeInitial()) {
    on<FetchHomeDataEvent>(_onFetchHomeData);
  }

  Future<void> _onFetchHomeData(
    FetchHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final result = await getHomeDataUsecase.call();

    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (data) => emit(HomeLoaded(data)),
    );
  }
}
