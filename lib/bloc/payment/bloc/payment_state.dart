part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

// ignore: must_be_immutable
class PaymentSuccess extends PaymentState {
  PaymentModel paymentModel;
  PaymentSuccess({this.paymentModel});
}

// ignore: must_be_immutable
class PaymentFailed extends PaymentState {
  String message;
  PaymentFailed({this.message});
}
