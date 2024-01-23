import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_with_tdd/core/data/errors/errors.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/data/model/eCommerceModel.dart';

abstract class ECommerceRepository {
  Future<Either<Errors, List<Product>>> getdata();
}
