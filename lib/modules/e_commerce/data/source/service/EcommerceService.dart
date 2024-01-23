import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_with_tdd/core/data/errors/errors.dart';
import 'package:ecommerce_app_with_tdd/core/singletons/dio.dart';
import 'package:ecommerce_app_with_tdd/core/singletons/serviceInit.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/data/model/eCommerceModel.dart';

abstract class EcommerceService {
  Future<Either<Errors, List<Product>>> getData();
}

class EcommerceNetworkService implements EcommerceService {
  final Dio dio = serviceLocator<DioSettings>().dio;
  @override
  Future<Either<Errors, List<Product>>> getData() async {
    try {
      Response response = await dio.get('http://192.168.42.184:8080/product');
      if (response.statusCode == 200) {
        // print(response.data);
        return right(
            (response.data as List).map((e) => Product.fromJson(e)).toList());
      } else {
        return left(ServerErrors(message: response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return left(ServerErrors(message: e.error.toString()));
    }
  }
}
