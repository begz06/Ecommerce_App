import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_with_tdd/core/data/errors/errors.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/data/model/eCommerceModel.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/domain/entity/eCommerceEntity.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/domain/usecase/eCommerceUseCase.dart';
import 'package:ecommerce_app_with_tdd/utils/enum.dart';
import 'package:equatable/equatable.dart';

part 'e_commerce_state.dart';

class ECommerceCubit extends Cubit<EcommerceState> {
  ECommerceCubit(this.getUsecase) : super(const EcommerceState(error: "")) {
    getdatas();
  }

  final GetEcommerceUseCase getUsecase;

  Future<void> getdatas() async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    Either<Errors, List<Product>> res = await getUsecase.repo.getdata();
    res.fold(
        (error) => emit(
            state.copyWith(status: ActionStatus.isError, error: error.message)),
        (data) =>
            emit(state.copyWith(status: ActionStatus.isSuccess, data: data)));
  }
}
