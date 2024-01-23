part of 'e_commerce_cubit.dart';

class EcommerceState extends Equatable {
  final List<EcommerceEntity> data;
  final ActionStatus status;
  final String error;
  const EcommerceState(
      {this.status = ActionStatus.isInitial,
      this.error = '',
      this.data = const []});

  EcommerceState copyWith(
      {List<EcommerceEntity>? data, ActionStatus? status, String? error}) {
    return EcommerceState(
        data: data ?? this.data,
        error: error ?? this.error,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, status, error];
}
