import 'package:dartz/dartz.dart';
import 'package:perfume_app/common/helper/mapper/home_mapper.dart';
import 'package:perfume_app/data/home/models/home_model.dart';
import 'package:perfume_app/data/home/sources/home_api_services.dart';
import 'package:perfume_app/domain/home/repositories/home_repository.dart';
import 'package:perfume_app/service_locator.dart';

class HomeRepoImpl extends HomeRepository {
  @override
  Future<Either> fetchHomeData() async {
    var returnedData = await sl<HomeApiServices>().fetchHomeData();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final model = HomeModel.fromJson(data);
        final entity = HomeMapper.toEntity(model);
        return Right(entity);
      },
    );
  }
}
