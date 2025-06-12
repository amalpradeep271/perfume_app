import 'package:get_it/get_it.dart';
import 'package:perfume_app/core/network/dio_client.dart';
import 'package:perfume_app/data/home/repositories/home_repo_impl.dart';
import 'package:perfume_app/data/home/sources/home_api_services.dart';
import 'package:perfume_app/domain/home/repositories/home_repository.dart';
import 'package:perfume_app/domain/home/usecases/get_home_data_usecase.dart';
import 'package:perfume_app/presentation/home/bloc/home_bloc.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<HomeApiServices>(HomeApiServicesImpl());
  //Repositories
  sl.registerSingleton<HomeRepository>(HomeRepoImpl());
  //Usecases
  sl.registerSingleton<GetHomeDataUsecase>(GetHomeDataUsecase());
  sl.registerFactory(() => HomeBloc(sl()));
}
