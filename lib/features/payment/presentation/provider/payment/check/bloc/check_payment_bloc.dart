import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kembang_belor_apps/features/home/domain/entities/tourism.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/selected_tourism_payment.dart';
import 'package:kembang_belor_apps/features/payment/domain/repository/payment_repository.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'check_payment_event.dart';
part 'check_payment_state.dart';

class CheckPaymentBloc extends Bloc<CheckPaymentEvent, CheckPaymentState> {
  final PaymentRepository _paymentRepository;
  CheckPaymentBloc(this._paymentRepository) : super(CheckPaymentInitial()) {
    on<CheckPayment>(_checkPayment);
  }

  void _checkPayment(
    CheckPayment event,
    Emitter<CheckPaymentState> emit,
  ) async {
    if (event._result.transactionStatus == TransactionResultStatus.settlement) {
      String orderID = await _paymentRepository.getUID();

      emit(CheckPaymentSucces(
        id: orderID,
        data: event._tourism,
        result: event._result,
      ));
      await _paymentRepository.insertData(
          id: orderID,
          uuid: event.uuid,
          date: event._tourism.date,
          idTourism: event._tourism.entity.id!);
    } else {
      emit(CheckPaymentFailed());
    }
  }
}
