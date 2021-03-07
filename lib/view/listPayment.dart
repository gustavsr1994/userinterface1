import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/bloc/payment/bloc/payment_bloc.dart';

class ListPayment extends StatefulWidget {
  @override
  _ListPaymentState createState() => _ListPaymentState();
}

class _ListPaymentState extends State<ListPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: BlocProvider(
          create: (context) => PaymentBloc(),
          child: BlocBuilder<PaymentBloc, PaymentState>(
            // ignore: missing_return
            builder: (context, state) {
              // ignore: close_sinks
              final refreshBloc = BlocProvider.of<PaymentBloc>(context);
              if (state is PaymentInitial) {
                refreshBloc.add(GetListPayment());
              } else if (state is PaymentLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PaymentFailed) {
                return Center(
                    child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          refreshBloc.add(GetListPayment());
                        },
                        child: Icon(Icons.refresh)),
                    Text(state.message),
                  ],
                ));
              } else if (state is PaymentSuccess) {
                return RefreshIndicator(
                    // Here we call that [RefreshEvent] in [RefreshBlocBloc]
                    onRefresh: () async {
                      refreshBloc.add(GetListPayment());
                    },
                    child: ListView.builder(
                        itemCount: state.paymentModel.payment.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorPrimary,
                                    blurRadius: 4.0,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.all(15),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  state.paymentModel.payment[index].name,
                                  style: fontDescription,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          );
                          ;
                        }));
              }
            },
          ),
        ),
      ),
    );
  }
}
