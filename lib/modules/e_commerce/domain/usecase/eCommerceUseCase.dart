import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_with_tdd/core/data/errors/errors.dart';
import 'package:ecommerce_app_with_tdd/core/data/usecase/usecase.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/data/model/eCommerceModel.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/domain/repository/eCommerceRepository.dart';

class GetEcommerceUseCase extends UseCase<List<Product>,String>{
  final ECommerceRepository repo;

  GetEcommerceUseCase({required this.repo});

  @override
  Future<Either<Errors, List<Product>>> call(String params) {
    return repo.getdata();
  }

}