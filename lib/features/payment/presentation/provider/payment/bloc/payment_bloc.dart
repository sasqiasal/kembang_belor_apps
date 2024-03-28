import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentLoading()) {
    on<GetPaymentLink>(_getPaymentLink);
  }

  void _getPaymentLink(GetPaymentLink event, Emitter<PaymentState> emit) {}
}
