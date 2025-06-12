import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:perfume_app/core/constants/api_urls.dart';
import 'package:perfume_app/core/network/dio_client.dart';
import 'package:perfume_app/service_locator.dart';

abstract class HomeApiServices {
  Future<Either> fetchHomeData();
}

class HomeApiServicesImpl implements HomeApiServices {
  @override
  Future<Either> fetchHomeData() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.home);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.statusMessage.toString());
    }
  }
}
