import 'package:dartz/dartz.dart';
import 'package:perfume_app/core/usecase/usecase.dart';
import 'package:perfume_app/domain/home/repositories/home_repository.dart';
import 'package:perfume_app/service_locator.dart';

class GetHomeDataUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<HomeRepository>().fetchHomeData();
  }
}
