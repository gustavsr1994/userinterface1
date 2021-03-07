import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/models/PaymentModel.dart';
import 'package:flutter_maps/repository/PaymentRepository.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial());

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    if(event is PaymentEvent){
      yield PaymentLoading();
            try {
        PaymentModel listPayment = await PaymentRepository.listPayment();
        yield PaymentSuccess(paymentModel: listPayment);
      } catch (e) {
        yield PaymentFailed(message: 'No Connection');
      }
    }
  }
}
