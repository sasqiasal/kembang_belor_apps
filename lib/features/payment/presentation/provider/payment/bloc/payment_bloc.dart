import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/core/resources/data_state/data_state.dart';
import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';
import 'package:kembang_belor_apps/features/payment/domain/usecases/payment.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetPaymentLinkUseCase _getPaymentLinkUseCase;
  PaymentBloc(this._getPaymentLinkUseCase) : super(PaymentInitial()) {
    on<GetPaymentLink>(_getPaymentLink);
  }

  void _getPaymentLink(GetPaymentLink event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());
    final dataState = await _getPaymentLinkUseCase(params: event.params);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(PaymentSucess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(PaymentError(dataState.error!));
    }
  }
}
